package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.MyBugDao;
import com.chao.pojo.MyBug;
import com.chao.pojo.QueryVo;
import com.chao.service.MyBugService;
import com.chao.utils.Page;

@Service
public class MyBugServiceImpl implements MyBugService {

	@Autowired
	MyBugDao myBugDao;
	

	//分页展示 bug
	@Override
	public Page<MyBug> selectMyBugAll(QueryVo vo) {
		
		Page<MyBug> page = new Page<MyBug>();
		
		page.setPage(vo.getPage());
		page.setSize(3);
		
		vo.setSize(3);
		vo.setStartPage((vo.getPage()-1) * vo.getSize());
		
		
		page.setTotal(myBugDao.selectMyBugCount(vo));
		page.setRows(myBugDao.selectMyBugAll(vo));
		
		return page;
		
	}

	//展示前五条数据
	@Override
	public List<MyBug> selectMyBugFive() {
		return myBugDao.selectMyBugFive();
	}


}
