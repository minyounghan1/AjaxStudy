package com.app.dao.users;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.app.dto.users.User;

public interface UserDao {
	
	public List<User> findUser();
	
	public List<User> findUserList(@Param("keyword") String keyword);
}
