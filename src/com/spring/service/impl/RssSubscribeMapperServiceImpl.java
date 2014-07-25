package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.RssSubscribeMapperDao;
import com.spring.entity.RssSubscribe;
import com.spring.service.RssSubscribeMapperService;

@Service("rssSubscribeMapperService")
public class RssSubscribeMapperServiceImpl extends BaseServiceImpl<RssSubscribe> implements RssSubscribeMapperService{

	@Autowired
	RssSubscribeMapperDao rssSubscribeMapperDao;

}
