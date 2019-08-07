package com.chao.mapper;

import java.util.List;

import com.chao.pojo.Comment;
import com.chao.pojo.QueryVo;

public interface CommentDao {

	int selectCommentCount();

	List<Comment> selectCommentByPage(QueryVo vo);

	void insertComment(QueryVo vo);

	void deleteCommentByid(Comment c);

}
