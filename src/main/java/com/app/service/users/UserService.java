package com.app.service.users;

import java.util.List;

import com.app.dto.users.User;

public interface UserService {
	
	public List<User> findUser();

	public List<User> findUserList(String keyword);
	
}
