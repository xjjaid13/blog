package com.spring.action;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.entity.User;
import com.spring.entity.WebLink;
import com.spring.entity.WebLinktype;
import com.spring.service.WebLinktypeMapperService;
import com.util.Constant;
import com.util.DataHandle;
import com.util.HtmlHandle;
import com.util.InitServlet;

@Controller
@RequestMapping("weblink")
public class WebLinkController {

	@Autowired
	WebLinktypeMapperService webLinktypeMapperService;
	
	@RequestMapping("view/{userId}")
	public String returnWebLink(Model model,@PathVariable int userId){
		WebLinktype webLinktype = new WebLinktype();
		webLinktype.setUserId(userId);
		List<WebLinktype> webLinkTypeList = webLinktypeMapperService.returnEntityList(webLinktype);
		
		model.addAttribute("webLinkTypeList", webLinkTypeList);
		return "weblink/view";
	}
	
	@RequestMapping("my-deleteWebLinktype")
	public void deleteLineType(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		LinkedList<WebLinktype> linkedListType = InitServlet.webLinkTypeMap.get(user.getUserId());
	    int typeIndex = DataHandle.returnValueInt(request, "typeIndex") - 1;
	    linkedListType.remove(typeIndex);
	    InitServlet.changeList.add(user.getUserId());
	    JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		response.getWriter().write(jsonObject.toString());
	}
	
	@RequestMapping("my-deleteWebLink")
    public void myDeleteWebLink(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		LinkedList<WebLinktype> linkedListType = InitServlet.webLinkTypeMap.get(user.getUserId());
        int urlIndex = DataHandle.returnValueInt(request, "urlIndex");
	    int typeIndex = DataHandle.returnValueInt(request, "typeIndex") - 1;
	    linkedListType.get(typeIndex).getWebLinkList().remove(urlIndex);
	    InitServlet.changeList.add(user.getUserId());
	    JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		response.getWriter().write(jsonObject.toString());
    }
	
	@RequestMapping("index/{userId}")
	public String doIndex(@PathVariable int userId,Model model,HttpServletRequest request){
		LinkedList<WebLinktype> webLinktypeList = InitServlet.webLinkTypeMap.get(userId);
		String view = DataHandle.returnValue(request, "view");
		model.addAttribute("webLinktypeList", webLinktypeList);
		model.addAttribute("view", view);
		return "weblink2/index";
	}
	
	public static void main(String[] args) {
		WebLink webLink = HtmlHandle.fetchFromRemote("www.baidu.com");
		System.out.println(webLink.getName());
	}
	
	@RequestMapping("addWebLinkData")
	public void addWebLinkData(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		String handleType = request.getParameter("handleType");
		String title = DataHandle.returnValue(request, "title");
		LinkedList<WebLinktype> linkedListType = InitServlet.webLinkTypeMap.get(user.getUserId());
		JSONObject jsonObject = new JSONObject();
		if("webLinktype".equals(handleType)){
			WebLinktype webLinktype = new WebLinktype();
			webLinktype.setName(title);
			webLinktype.setUserId(user.getUserId());
			if(linkedListType == null){
				linkedListType = new LinkedList<WebLinktype>();
				InitServlet.webLinkTypeMap.put(user.getUserId(), linkedListType);
			}
			linkedListType.add(webLinktype);
			jsonObject.put("webLinktype", webLinktype);
		}else if("webLink".equals(handleType)){
			String url = DataHandle.returnValue(request, "url");
			int typeIndex = DataHandle.returnValueInt(request, "typeIndex");
			WebLinktype webLinktype = linkedListType.get(typeIndex);
			WebLink webLink = HtmlHandle.fetchFromRemote(url);
			if(webLink == null){
				jsonObject.put("result", "error");
				response.getWriter().write(jsonObject.toString());
				return;
			}
			if(!DataHandle.isNullOrEmpty(title)){
				webLink.setName(title);
			}
			webLink.setUserId(user.getUserId());
			webLink.setWebLinktypeId(webLinktype.getWebLinktypeId());
			LinkedList<WebLink> webLinkList = webLinktype.getWebLinkList();
			if(webLinkList == null){
				webLinkList = new LinkedList<WebLink>();
				webLinkList.add(webLink);
				webLinktype.setWebLinkList(webLinkList);
			}else{
				webLinkList.add(webLink);
			}
			jsonObject.put("webLink", webLink);
		}
		InitServlet.changeList.add(user.getUserId());
		jsonObject.put("result", "success");
		response.getWriter().write(jsonObject.toString());
	}
	
	@RequestMapping("updateWebLinkData")
	public void updateWebLinkData(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		String handleType = request.getParameter("handleType");
		int fromIndex = DataHandle.returnValueInt(request, "fromIndex");
		int toIndex = DataHandle.returnValueInt(request, "toIndex");
		LinkedList<WebLinktype> linkedListType = InitServlet.webLinkTypeMap.get(user.getUserId());
		if("webLinktype".equals(handleType)){
			WebLinktype fromWebLinktype = linkedListType.get(fromIndex -1); 
			linkedListType.remove(fromIndex - 1);
			linkedListType.add(toIndex - 1, fromWebLinktype);
		}else if("webLink".equals(handleType)){
			int currentType = DataHandle.returnValueInt(request, "currentType") - 1;
			int oringType = DataHandle.returnValueInt(request, "oringType") - 1;
			WebLinktype webLinktype = linkedListType.get(currentType);
			webLinktype.setChange(true);
			WebLinktype oringWebLinktype = linkedListType.get(oringType);
			oringWebLinktype.setChange(true);
			LinkedList<WebLink> webLinkLinkedList = oringWebLinktype.getWebLinkList();
			WebLink webLink = webLinkLinkedList.get(fromIndex);
			if(currentType != oringType){
				webLink.setWebLinktypeId(currentType);
			}
			webLinkLinkedList.remove(fromIndex);
			if(toIndex == -1){
				webLinktype.getWebLinkList().add(webLink);
			}else{
				webLinktype.getWebLinkList().add(toIndex, webLink);
			}
		}
		InitServlet.changeList.add(user.getUserId());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		response.getWriter().write(jsonObject.toString());
	}
	
}
