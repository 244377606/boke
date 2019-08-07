package com.chao.mapper;

import java.util.List;

import com.chao.pojo.Comment;
import com.chao.pojo.PageData;

public interface CommentDao {

	List<Comment> selectCommentAll(PageData pageData);

	Integer selectCommentCount(PageData pageData);

	Integer deleteCommentById(Integer id);

	Integer deleteCommentByIds(Integer[] ids);

	Comment selectCommentByid(Integer id);

	Integer UpdateComment(PageData data);

}
