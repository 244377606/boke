package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.CommentDao;
import com.chao.pojo.Comment;
import com.chao.pojo.PageData;
import com.chao.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao commentDao;
	
	//====================留言板信息
	@Override
	public List<Comment> selectCommentAll(PageData pageData) {
		pageData.setStartPage((pageData.getPage()-1) * pageData.getLimit());
		return commentDao.selectCommentAll(pageData);
	}
	
	//留言总数
	@Override
	public Integer selectCommentCount(PageData pageData) {
		return commentDao.selectCommentCount(pageData);
	}
	
	//单 id 删除 留言
	@Override
	public Integer deleteCommentById(Integer id) {
		return commentDao.deleteCommentById(id);
	}
	
	//多id 删除 留言
	@Override
	public Integer deleteCommentByIds(Integer[] ids) {
		return commentDao.deleteCommentByIds(ids);
	}

	//通过id 查询留言信息
	@Override
	public Comment selectCommentByid(Integer id) {
		return commentDao.selectCommentByid(id);
	}

	//更新留言信息
	@Override
	public Integer UpdateComment(PageData data) {
		return commentDao.UpdateComment(data);
	}

	

}
