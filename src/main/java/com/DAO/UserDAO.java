package com.DAO;

import com.Entity.UserEntity;

public interface UserDAO {
	public boolean userRegister(UserEntity us);
	public UserEntity loginUser(UserEntity user);
	public boolean checkPassword(int uid,String password);
	public boolean updateUserInfo(UserEntity us);
}
