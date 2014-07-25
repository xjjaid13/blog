package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.entity.Blog;

public interface BlogMapperService extends BaseService<Blog>{

	public List<Blog> returnTitleEntity(Blog blog);
	
	public List<Map<String,Object>> selectYear(Blog blog);
	
	public List<Map<String,Object>> selectMonth(Blog blog);
	
	public List<Map<String,Object>> selectDay(Blog blog);
	
}
