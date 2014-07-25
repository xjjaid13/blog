package com.spring.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("about-me")
public class AboutMeController {

	@RequestMapping("index")
	public String doBlogList(){
		return "about-me/index";
	}
	
}
