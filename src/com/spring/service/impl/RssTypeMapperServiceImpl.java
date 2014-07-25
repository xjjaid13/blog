package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.RssTypeMapperDao;
import com.spring.entity.RssType;
import com.spring.service.RssTypeMapperService;

@Service("rssTypeMapperService")
public class RssTypeMapperServiceImpl extends BaseServiceImpl<RssType> implements RssTypeMapperService{

	@Autowired
	RssTypeMapperDao rssTypeMapperDao;

}
