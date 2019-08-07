package com.chao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.CommentDao;
import com.chao.pojo.Comment;
import com.chao.pojo.QueryVo;
import com.chao.service.CommentService;
import com.chao.utils.Page;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao commentDao;
	
	@Override
	public Page<Comment> selectCommentByPage(QueryVo vo) {
		
		Page<Comment> page = new Page<Comment>();
		
		page.setSize(5);    //设置页面每页显示条数
		page.setPage(vo.getPage()); //设置当前页
		
		vo.setSize(5);    //查询显示页数
		vo.setStartPage((vo.getPage()-1) * vo.getSize()); //设置查询开始位置
		
		page.setTotal(commentDao.selectCommentCount());  //查询数据总条数
		page.setRows(commentDao.selectCommentByPage(vo)); //根据条件查询数据
		
		return page;
	}

	@Override
	public void insertComment(QueryVo vo) {
		commentDao.insertComment(vo);
		
	}

	@Override
	public void deleteCommentByid(Comment c) {
		commentDao.deleteCommentByid(c);
		
	}

}
