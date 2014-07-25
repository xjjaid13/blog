package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.TypeMapperDao;
import com.spring.entity.Type;
import com.spring.service.TypeMapperService;

@Service("typeMapperService")
public class TypeMapperServiceImpl extends BaseServiceImpl<Type> implements TypeMapperService{

	@Autowired
	TypeMapperDao typeMapperDao;

}
