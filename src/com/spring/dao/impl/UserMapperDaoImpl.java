package com.spring.dao.impl;

import org.springframework.stereotype.Repository;
import com.spring.dao.UserMapperDao;
import com.spring.entity.User;

@Repository
public class UserMapperDaoImpl extends BaseDaoImpl<User> implements UserMapperDao {

	@Override
	public User returnEntityByUserName(User user) {
		return (User)sqlSessionTemplate.selectOne("returnUserEntityByUserName", user);
	}
	
}
