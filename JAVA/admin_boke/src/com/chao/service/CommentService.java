package com.chao.service;

import java.util.List;

import com.chao.pojo.Comment;
import com.chao.pojo.PageData;

public interface CommentService {

	List<Comment> selectCommentAll(PageData pageData);

	Integer selectCommentCount(PageData pageData);

	Integer deleteCommentById(Integer id);

	Integer deleteCommentByIds(Integer[] ids);

	Comment selectCommentByid(Integer id);

	Integer UpdateComment(PageData data);

}
