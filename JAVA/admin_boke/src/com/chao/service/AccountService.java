package com.chao.service;

import java.util.List;

import com.chao.pojo.Admin;
import com.chao.pojo.PageData;
import com.chao.pojo.User;

public interface AccountService {

	//===管理员账户信息
	List<Admin> selectAdminAccount(PageData pageData);

	Integer selectAdminAccountCount(PageData pageData);

	Admin selectAdminByName(Admin a);

	List<User> selectUserAccount(PageData data);

	Integer selectUserAccountCount(PageData data);

	int deleteUserById(Integer id);

	int deleteUserByIds(Integer[] ids);



}
