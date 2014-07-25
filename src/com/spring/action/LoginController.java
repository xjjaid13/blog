package com.spring.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.entity.User;
import com.spring.service.UserMapperService;
import com.util.Constant;
import com.util.DataHandle;

@Controller
@RequestMapping("login")
public class LoginController {

	@Autowired
	private UserMapperService userMapperService; 
	
	/**
	 * 跳转到登陆界面
	 * */
	@RequestMapping("index")
	public String doIndex(){
		return "login/index";
	}
	
	/**
	 * 登陆请求
	 * */
	@RequestMapping("login-post")
	public void doLoginPost(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		String userName = DataHandle.returnValue(request, "username");
		String passWord = DataHandle.returnValue(request, "password");
		User user = new User();
		user.setUserId(1);
		user.setUsername(userName);
		user.setPassword(passWord);
		user = userMapperService.returnEntityByUserName(user);
		if(user != null){
			session.setAttribute(Constant.USER, user);
			response.getWriter().print(user.getUserId());
		}else{
			response.getWriter().print("error");
		}
	}
	
	@RequestMapping("login-info")
	public void doLoginInfo(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		User user = (User)session.getAttribute(Constant.USER);
		if(user == null){
			response.getWriter().print("nolog");
		}else{
			response.getWriter().print(user.getUsername());
		}
	}
	
	/**
	 * 注销
	 * */
	@RequestMapping("login-out")
	public String doLoginOut(HttpSession session){
		session.setAttribute(Constant.USER, null);
		return "redirect:/blog/index";
	}
	
	public static void main(String[] args) throws IOException{
		InputStream in = ClassLoader.getSystemResourceAsStream("jdbc.properties");
		InputStreamReader inReader = new InputStreamReader(in,"UTF-8");
		BufferedReader rb = new BufferedReader(inReader);
		StringBuffer strBuf = new StringBuffer();
		int tempbyte;
		while((tempbyte = rb.read()) != -1){
			strBuf.append((char)tempbyte);
		}
	}
	
}
