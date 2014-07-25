package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.UserMapperDao;
import com.spring.entity.User;
import com.spring.service.UserMapperService;

@Service("userMapperService")
public class UserMapperServiceImpl extends BaseServiceImpl<User> implements UserMapperService{

	@Autowired
	UserMapperDao userMapperDao;
	
	@Override
	public User returnEntityByUserName(User user) {
		return userMapperDao.returnEntityByUserName(user);
	}

}
