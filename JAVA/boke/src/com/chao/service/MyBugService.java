package com.chao.service;

import java.util.List;

import com.chao.pojo.MyBug;
import com.chao.pojo.QueryVo;
import com.chao.utils.Page;

public interface MyBugService {

	Page<MyBug> selectMyBugAll(QueryVo vo);

	List<MyBug> selectMyBugFive();

}
