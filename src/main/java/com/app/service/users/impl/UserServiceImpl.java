package com.app.service.users.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.users.UserDao;
import com.app.dto.users.User;
import com.app.dto.users.UserSerch;
import com.app.service.users.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;

	@Override
	public List<User> findUserList(String keyword) {
		List<User> user = userDao.findUserList(keyword);
		return user;
	}

	@Override
	public List<User> findUser() {
		List<User> user = userDao.findUser();
		return user;
	}

}
