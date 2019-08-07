package com.chao.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chao.pojo.QueryVo;
import com.chao.pojo.User;
import com.chao.service.ArticleService;

@Controller
public class UserLoginController {
	
	@Autowired
	ArticleService articleService;
	
	//判断账号是否登录
	@RequestMapping("/userLogin")
	public @ResponseBody 
	boolean userLogin(User user,HttpSession session){
		
		User userLogin = articleService.selectUserLogin(user);
		if(userLogin != null){
			session.setAttribute("USER", userLogin);
			return true;
		}
		return false;
	}

	//注销账号
	@RequestMapping("/zhuXiao")
	public @ResponseBody
	void zhuXiao(HttpSession session){
		session.removeAttribute("USER");
	}
	
	//判断账号是否存在
	@RequestMapping("/relaAccount")
	public @ResponseBody
	boolean zhuCe(User user){
		User userInfo = articleService.selectAccountIsExist(user);
		if(userInfo != null){
			return true;
		}
		return false;
	}
	
	//头像上传 功能
	@RequestMapping("/upImg")
	public @ResponseBody 
	String upImg(MultipartFile file){
		String newName = null;
		
		//上传文件到 本地
		try {
			//防止图片名称重复造成 覆盖
			String uuid = UUID.randomUUID().toString(); 
			
			//获得文件的名称
			String oldName = file.getOriginalFilename();
			
			//截取 原文件的 后缀名
			String houZhuiName = oldName.substring(oldName.indexOf("."));
			
			//组成新的 图片名称
			newName = uuid + houZhuiName;
			
			//上传图片到本地
			file.transferTo( new File("C:/images",newName));
			
			
		} catch (Exception e) {
			newName = null;
		} 
		return newName;
	}
	
	//注册 用户
	@RequestMapping("/zhuCe")
	public String zhuCe(QueryVo vo,Model mo,HttpSession session){
		
		if(vo.getUser_account() != null && vo.getUser_password() != null){
			//设置用户创建的时间
			Date date = new Date(); 
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String userTime = format.format(date);
			vo.setUser_time(userTime);
			
			//新增账户信息
			articleService.insertUserInfo(vo);
			
			//查询新增的 帐号 放入session
			User user = new User();
			user.setU_password(vo.getUser_password());
			user.setU_account(vo.getUser_account());
			
			User userLogin = articleService.selectUserLogin(user);
			
			if(userLogin != null){
				session.setAttribute("USER", userLogin);
			}
		} 
		
		
		//判断为空则跳到 留言页面  不为空则是文章评论页面
		if(vo.getArticleId() == null){
			return "redirect:/comment";
		}
		
		return "redirect:/articleCritique?articleId="+vo.getArticleId();
		//return "forward:/articleCritique"; 转发
	}
	

	
	 
	//域名转发
	@RequestMapping("/")
	public String a11(){
		return "redirect:/index";
	}
	
	//转发到后台登录
	@RequestMapping("/admin/adminLogin")
	public String adminLogin(){
		
		return "redirect:/admin_boke/adminLogin";
	}
}
