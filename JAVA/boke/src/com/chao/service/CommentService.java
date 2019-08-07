package com.chao.service;

import com.chao.pojo.Comment;
import com.chao.pojo.QueryVo;
import com.chao.utils.Page;

public interface CommentService {

	Page<Comment> selectCommentByPage(QueryVo vo);

	void insertComment(QueryVo vo);

	void deleteCommentByid(Comment c);

}
