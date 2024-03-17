package com.app.dao.users.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.users.UserDao;
import com.app.dto.users.User;
import com.app.dto.users.UserSerch;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<User> findUserList(String keyword) {
		List<User> user = sqlSessionTemplate.selectList("user_mapper.serchUsers",keyword);
		return user;
	}

	@Override
	public List<User> findUser() {
		List<User> user = sqlSessionTemplate.selectList("user_mapper.findUsers");
		return user;
	}

}
