package com.spring.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import com.spring.entity.Note;
import com.spring.service.NoteMapperService;
import com.util.CommonHandle;
import com.util.Constant;
import com.util.DataHandle;
import com.util.TimeHandle;

@Controller
@RequestMapping("note")
public class NoteController {

    @Autowired
    NoteMapperService noteMapperService;
    
    @RequestMapping("view/{userId}")
    public String toIndex(@PathVariable int userId,Model model){
        Note note = new Note();
        note.setUserId(userId);
        List<Note> noteList = noteMapperService.selectList(note);
        model.addAttribute("noteList", noteList);
        return "note/view";
    }
    

    @RequestMapping("my/{userId}")
    public String toMyIndex(@PathVariable int userId,Model model){
        Note note = new Note();
        note.setUserId(userId);
        List<Note> noteList = noteMapperService.selectList(note);
        model.addAttribute("noteList", noteList);
        return "note/myIndex";
    }
    
    @RequestMapping("my-addNote")
    public void addNote(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
        User user = (User) session.getAttribute(Constant.USER);
        String content = DataHandle.returnValue(request, "content");
        Note note = new Note();
        note.setContent(content);
        note.setCreateDate(TimeHandle.currentTime());
        note.setUserId(user.getUserId());
        noteMapperService.insert(note);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "success");
        jsonObject.put("message", "新增成功");
        response.getWriter().write(jsonObject.toString());
    }
    
    @RequestMapping("my-updateNote")
    public void updateNote(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	int noteId = DataHandle.returnValueInt(request, "noteId");
    	String content = DataHandle.returnValue(request, "content");
    	Note note = new Note();
    	note.setNoteId(noteId);
    	note = noteMapperService.select(note);
    	if(note.getUserId() == user.getUserId()){
    		note.setContent(content);
    		noteMapperService.update(note);
    		JSONObject jsonObject = new JSONObject();
    		jsonObject.put("result", "success");
            jsonObject.put("message", "修改成功");
            response.getWriter().write(jsonObject.toString());
    	}
    }
    
    @RequestMapping("my-deleteNote")
    public void deleteNote(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	int noteId = DataHandle.returnValueInt(request, "noteId");
    	Note note = new Note();
    	note.setIds(noteId+"");
    	noteMapperService.deleteByIds(note);
    	JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
        jsonObject.put("message", "删除成功");
        response.getWriter().write(jsonObject.toString());
    }
    
    @RequestMapping("returnNoteContent")
    public void returnNoteContent(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException, InterruptedException{
    	int startPage = DataHandle.returnValueInt(request, "startPage");
    	if(startPage == 0){
    		startPage = 1;
    	}
    	int recordNum = DataHandle.returnValueInt(request, "recordNum");
    	if(recordNum == 0){
    		recordNum = Constant.BLOGPAGE;
    	}
    	//String searchKey = DataHandle.returnValue(request, "searchKey");
    	String timeValue = DataHandle.returnValue(request, "timeValue");
    	// 1 年 2月  3日
    	String condition = " 1 = 1 ";
    	int timeType = DataHandle.returnValueInt(request, "timeType");
    	if(timeType == 1){
    		condition += " and createDate >= " + timeValue + "-01-01 00:00:00 and createDate <= " + timeValue + "-12-31 23:59:59";
    	}else if(timeType == 2){
    		condition += " and createDate >= " + timeValue + "-01 00:00:00 and createDate <= " + timeValue + "-31 23:59:59";
    	}else if(timeType == 3){
    		condition += " and createDate >= " + timeValue + " 00:00:00 and createDate <= " + timeValue + " 23:59:59";
    	}
    	condition += "order by createDate desc";
        Note note = new Note();
        note.setCondition(condition);
        note.setPage(recordNum);
        note.setStartPage((startPage - 1) * recordNum);
        List<Note> list = noteMapperService.selectList(note);
        int recordSum = noteMapperService.count(note);
        int pageSum = CommonHandle.returnPageCount(recordSum, recordNum);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", list);
        jsonObject.put("recordSum", recordSum);
        jsonObject.put("pageSum", pageSum);
        response.getWriter().write(jsonObject.toString());
    }
    
    @RequestMapping("returnNote")
    public void returnNote(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	int noteId = DataHandle.returnValueInt(request, "noteId");
    	Note note = new Note();
    	note.setNoteId(noteId);
    	note = noteMapperService.select(note);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", note);
    	response.getWriter().write(jsonObject.toString());
    }
    
    /**
     * 获得时间树的年份和便签数
     * */
    @RequestMapping("returnTreeYear")
    public void returnTreeYear(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	Note note = new Note();
    	note.setUserId(user.getUserId());
    	List<Map<String, Object>> noteList = noteMapperService.selectYear(note);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", noteList);
    	response.getWriter().write(jsonObject.toString());
    }
    
    /**
     * 获得时间树的月份和便签数
     * */
    @RequestMapping("returnTreeMonth")
    public void returnTreeMonth(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	String year = request.getParameter("year");
    	String condition = "createDate >= '" + year + "-01-01 00:00:00' and createDate <= '" + year + "-12-31 23:59:59'";
    	Note note = new Note();
    	note.setCondition(condition);
    	note.setUserId(user.getUserId());
    	List<Map<String, Object>> noteList = noteMapperService.selectMonth(note);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", noteList);
    	response.getWriter().write(jsonObject.toString());
    }
    
    /**
     * 获得时间树的天数和便签数
     * */
    @RequestMapping("returnTreeDay")
    public void returnTreeDay(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	String year = request.getParameter("year");
    	String month = request.getParameter("month");
    	String condition = "createDate >= '" + year + "-" + month + "-01 00:00:00' and createDate <= '" + year + "-" + month + "-31 23:59:59'";
    	Note note =  new Note();
    	note.setUserId(user.getUserId());
    	note.setCondition(condition);
    	List<Map<String, Object>> noteList = noteMapperService.selectDay(note);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", noteList);
    	response.getWriter().write(jsonObject.toString());
    }
    
//    @RequestMapping("test")
//    public void test(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
//        JSONArray listDay = new JSONArray();
//        JSONObject jsonObjectDay = new JSONObject();
//        jsonObjectDay.put("display", "2日");
//        jsonObjectDay.put("num", "3");
//        listDay.add(jsonObjectDay);
//        
//        JSONArray listWeek = new JSONArray();
//        JSONObject jsonObjectWeek = new JSONObject();
//        jsonObjectWeek.put("display", "2周");
//        jsonObjectWeek.put("num", "3");
//        jsonObjectWeek.put("data", listDay);
//        listWeek.add(jsonObjectWeek);
//        
//        JSONArray listMonth = new JSONArray();
//        JSONObject jsonObjectMonth = new JSONObject();
//        jsonObjectMonth.put("display", "2月");
//        jsonObjectMonth.put("num", "3");
//        jsonObjectMonth.put("data", listWeek);
//        listMonth.add(jsonObjectMonth);
//        
//        JSONArray listYear = new JSONArray();
//        JSONObject jsonObjectYear = new JSONObject();
//        jsonObjectYear.put("display", "2000年");
//        jsonObjectYear.put("num", "3");
//        jsonObjectYear.put("data", listMonth);
//        listYear.add(jsonObjectYear);
//        
//        JSONObject object = new JSONObject();
//        object.put("data", listYear);
//        String jsonString = JSONObject.fromObject(object).toString();
//        response.getWriter().write(JSONObject.fromObject(object).toString());
//    }
    
}
