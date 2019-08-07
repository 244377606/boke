package com.chao.mapper;

import java.util.List;

import com.chao.pojo.Admin;
import com.chao.pojo.PageData;
import com.chao.pojo.User;

public interface AccountDao {

	Admin selectAdminByName(Admin a);
	
	List<Admin> selectAdminAccount(PageData pageData);

	Integer selectAdminAccountCount(PageData pageData);

	List<User> selectUserAccount(PageData data);

	Integer selectUserAccountCount(PageData data);

	int deleteUserById(Integer id);

	int deleteUserByIds(Integer[] ids);




}
