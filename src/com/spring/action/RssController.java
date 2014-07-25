package com.spring.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.entity.Rss;
import com.spring.entity.RssType;
import com.spring.entity.User;
import com.spring.service.RssTypeMapperService;
import com.util.Constant;
import com.util.DataHandle;

@Controller
@RequestMapping("rss")
public class RssController {

	@Autowired	
	RssTypeMapperService rssTypeMapperService;
	
	@RequestMapping("my")
	public String doIndex(){
		return "rss/index";
	}
	
	@RequestMapping("myAddRssType")
	public void doMyAddRssType(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		String typeName = DataHandle.returnValue(request, "typeName");
		RssType rssType = new RssType();
		rssType.setTypeName(typeName);
		rssType.setUserId(user.getUserId());
		int id = rssTypeMapperService.insertAndReturnId(rssType);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("id", id);
		response.getWriter().write(jsonObject.toString());
	}
	
	@RequestMapping("myDeleteRssType")
	public void doMyDeleteRssType(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		int rssTypeId = DataHandle.returnValueInt(request, "rssTypeId");
		RssType rssType = new RssType();
		rssType.setRssTypeId(rssTypeId);
		rssTypeMapperService.delete(rssType);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		response.getWriter().write(jsonObject.toString());
	}
	
	@RequestMapping("myAlterRssType")
	public void doMyAlterRssType(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		int rssTypeId = DataHandle.returnValueInt(request, "rssTypeId");
		String typeName = DataHandle.returnValue(request, "typeName");
		RssType rssType = new RssType();
		rssType.setRssTypeId(rssTypeId);
		rssType.setTypeName(typeName);
		rssTypeMapperService.update(rssType);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		response.getWriter().write(jsonObject.toString());
	}
	
	@RequestMapping("myAddRss")
	public void doAddRss(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		User user = (User) session.getAttribute(Constant.USER);
		int typeId = DataHandle.returnValueInt(request, "typeId");
		String link = DataHandle.returnValue(request, "link");
		
	}
	
	@RequestMapping("returnTree")
	public void doBlogList(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String content = "";
		String id = request.getParameter("id");
		if("#".equals(id)){
			content += "[{ \"id\" : \"ajson1\", \"parent\" : \"#\", \"text\" : \"Simple root node\" },";
			content += "{ \"id\" : \"ajson2\", \"parent\" : \"#\", \"text\" : \"Root node 2\",\"children\" : true }]";
			response.getWriter().write(content.toString());
		}else{
			content += "[{ \"id\" : \"ajson21\", \"parent\" : \""+id+"\", \"text\" : \"Simple root node\" },";
			content += "{ \"id\" : \"ajson22\", \"parent\" : \""+id+"\", \"text\" : \"Root node 2\" }]";
			response.getWriter().write(content.toString());
		}
	}
	
}
