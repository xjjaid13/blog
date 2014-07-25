package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.WebLinkMapperDao;
import com.spring.entity.WebLink;
import com.spring.service.WebLinkMapperService;

@Service("webLinkMapperService")
public class WebLinkMapperServiceImpl extends BaseServiceImpl<WebLink> implements WebLinkMapperService{

	@Autowired
	WebLinkMapperDao webLinkMapperDao;
	
}
