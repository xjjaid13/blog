package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.BlogTypeMapperDao;
import com.spring.entity.BlogType;
import com.spring.service.BlogTypeMapperService;

@Service("blogTypeMapperService")
public class BlogTypeMapperServiceImpl extends BaseServiceImpl<BlogType> implements BlogTypeMapperService{

	@Autowired
	BlogTypeMapperDao blogTypeMapperDao;

}
