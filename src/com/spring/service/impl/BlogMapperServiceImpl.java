package com.spring.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.BlogMapperDao;
import com.spring.entity.Blog;
import com.spring.service.BlogMapperService;

@Service
public class BlogMapperServiceImpl extends BaseServiceImpl<Blog> implements BlogMapperService{

	@Autowired
	BlogMapperDao blogMapperDao;

	@Override
	public List<Blog> returnTitleEntity(Blog t){
		return blogMapperDao.returnTitleEntity(t);
	}
	
	@Override
	public List<Map<String, Object>> selectYear(Blog t) {
		return blogMapperDao.selectYear(t);
	}

	@Override
	public List<Map<String, Object>> selectMonth(Blog t) {
		return blogMapperDao.selectMonth(t);
	}

	@Override
	public List<Map<String, Object>> selectDay(Blog t) {
		return blogMapperDao.selectDay(t);
	}
	
}
