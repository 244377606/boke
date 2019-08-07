package com.chao.mapper;

import java.util.List;

import com.chao.pojo.MyBug;
import com.chao.pojo.QueryVo;

public interface MyBugDao {

	List<MyBug> selectMyBugAll(QueryVo vo);

	List<MyBug> selectMyBugFive();

	int selectMyBugCount(QueryVo vo);

}
