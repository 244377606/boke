package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.AccountDao;
import com.chao.pojo.Admin;
import com.chao.pojo.PageData;
import com.chao.pojo.User;
import com.chao.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao accountDao;
	
	//通过帐号密码判断登录
	@Override
	public Admin selectAdminByName(Admin a) {
		return accountDao.selectAdminByName(a);
	}
	
	//查询管理员账户信息
	@Override
	public List<Admin> selectAdminAccount(PageData pageData) {
		
		pageData.setStartPage((pageData.getPage()-1) * pageData.getLimit());
		
		return accountDao.selectAdminAccount(pageData);
	}

	// 查询管理员 总数
	@Override
	public Integer selectAdminAccountCount(PageData pageData) {
		return accountDao.selectAdminAccountCount(pageData);
	}

	
	//普通帐号 所有信息 分页显示
	@Override
	public List<User> selectUserAccount(PageData data) {
		data.setStartPage((data.getPage()-1) * data.getLimit());
		return accountDao.selectUserAccount(data);
	}

	//帐号 总条数
	@Override
	public Integer selectUserAccountCount(PageData data) {
		return accountDao.selectUserAccountCount(data);
	}

	//按id 删除普通帐号
	@Override
	public int deleteUserById(Integer id) {
		return accountDao.deleteUserById(id);
	}

	//按多个 id 删除普通帐号
	@Override
	public int deleteUserByIds(Integer[] ids) {
		return accountDao.deleteUserByIds(ids);
	}

	
	

	


}
