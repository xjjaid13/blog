package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.TagMapperDao;
import com.spring.entity.Tag;
import com.spring.service.TagMapperService;

@Service("tagMapperService")
public class TagMapperServiceImpl extends BaseServiceImpl<Tag> implements TagMapperService{

	@Autowired
	TagMapperDao tagMapperDao;

}
