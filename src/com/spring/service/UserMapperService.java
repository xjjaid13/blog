package com.spring.service;

import com.spring.entity.User;

public interface UserMapperService extends BaseService<User>{

	public User returnEntityByUserName(User User);
	
}
