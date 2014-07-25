package com.spring.dao;

import com.spring.entity.User;

public interface UserMapperDao extends BaseDao<User>{

	public User returnEntityByUserName(User user);
	
}
