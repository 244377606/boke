package com.chao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chao.pojo.Comment;
import com.chao.pojo.QueryVo;
import com.chao.pojo.User;
import com.chao.service.CommentService;
import com.chao.utils.Page;

@Controller
public class commentController {

	@Autowired
	CommentService commentService;
	
	@RequestMapping("/comment")
	public String aboutMe(QueryVo vo,Model mo){
		
		//分页展示留言信息
		Page<Comment> page = commentService.selectCommentByPage(vo);
		mo.addAttribute("page",page);
		
		return "comment/comment";
	}
	
	//新增留言
	@RequestMapping("/commentContent")
	public String commentContent(QueryVo vo,Model mo,HttpSession session){
		
		User user = (User) session.getAttribute("USER");
		//判断 内容 并且 用户账号存在
		if(vo.getCritique_content() != null && user != null){
			
			//创建留言时间
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String string = format.format(date);
			
			vo.setCritique_time(string);
			
			//新增留言
			vo.setCritique_content("<pre>"+vo.getCritique_content()+"</pre>");
			
			commentService.insertComment(vo);	
			
		}
		
		return "redirect:/comment";
	}
	
	//删除 留言信息
	@RequestMapping("/deleteCommentByid")
	public @ResponseBody
	void deleteCommentById(Comment c){
		commentService.deleteCommentByid(c);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}