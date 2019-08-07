package com.chao.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chao.pojo.Comment;
import com.chao.pojo.PageData;
import com.chao.service.CommentService;

@Controller
public class commentController {

	@Autowired
	CommentService commentService;
	
	//留言版页面
	@RequestMapping("/comment")
	public String comment(){
		return "comment/comment";
	}
	
	//展示留言信息 
	@RequestMapping("/commentInfo")
	public @ResponseBody
	PageData commentInfo(PageData pageData){
		
		PageData page = new PageData();
		List<Comment> comment = commentService.selectCommentAll(pageData);
				
		if(comment !=null){
			page.setCode("0");
			page.setCount(commentService.selectCommentCount(pageData));
			page.setData(comment);
		}else{
			page.setCode("1");
			page.setMsg("嘛也没有");
		}
		
		return page;
	}
	
	
	//删除 单个 留言信息
	@RequestMapping("/deleteCommentById")
	public @ResponseBody 
	Integer deleteCommentById(@RequestParam(value = "id") Integer id){
		Integer a = commentService.deleteCommentById(id);
		return a;
	}
	
	//批量删除 帐号信息 
	@RequestMapping("/deleteCommentByIds")
	public @ResponseBody 
	Integer deleteCommentByIds(@RequestParam(value = "ids[]") Integer[] ids){
		Integer a = commentService.deleteCommentByIds(ids);
		return a;
	}	
	
	//回显 留言数据
	@RequestMapping("/commentData")
	public String commentData(Integer id,Model mo){
		
		Comment comment = commentService.selectCommentByid(id);
		mo.addAttribute("comment",comment);
		
		return "comment/commentData";
	}
	
	//修改留言
	@RequestMapping("/commentUpdate")
	public @ResponseBody 
	Integer commentUpdate(PageData data){
		
		Integer a =  commentService.UpdateComment(data);
		
		return a;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	
	@RequestMapping("/comment")
	public String aboutMe(QueryVo vo,Model mo){
		
		
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

	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}