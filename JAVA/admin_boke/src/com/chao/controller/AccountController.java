package com.chao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chao.pojo.Admin;
import com.chao.pojo.PageData;
import com.chao.pojo.User;
import com.chao.service.AccountService;
import com.chao.util.FileUpAndDown;

/**
 * 
 * 管理员登录 页面
 * 账号管理 页面
 * 
 * 首页面
 * 
 * 
 */
@Controller
public class AccountController {

	@Autowired
	AccountService accountService;
	
  //进入后台管理 登录页面
	@RequestMapping("/adminLogin")
	public String login(){
		return "adminLogin";
	}
	
	//判断是否可以成功登录
	@RequestMapping("/adminIsLogin")
	public @ResponseBody 
	String adminLogin(HttpSession session,Admin a){
		
		String state = null; 
		
		//判断验证码是否正确
		String code = (String) session.getAttribute("CODE");
		String adminCode = a.getAdminCode();
		
		if(!code.equals(adminCode)){
			state = "3";    //验证码错误
		}else{ 
			//验证码正确 再去 判断账号/密码是否存在
			Admin admin = accountService.selectAdminByName(a);
			if(admin == null){
				state = "2";    //密码或账号错误
			}else{
				state = "1";    //返回成功
				session.setAttribute("ADMIN_ACCOUNT", admin);
			}
		}
		return state;
	}
	
	//退出登录
	@RequestMapping("/adminExit")
	public String adminExit(HttpSession session){
		session.removeAttribute("ADMIN_ACCOUNT");
		return "redirect:/adminLogin";
	}
	
	
	//登录后 进入首页面
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
//首页 iframe 默认首先 加载管理员信息页面
	@RequestMapping("/adminAccount")
	public String adminAccount(){
		return "account/adminInfo";
	}
	
	//数据表格 加载管理员所有信息
	@RequestMapping("/adminAccountInfo")
	public @ResponseBody
	PageData adminAccountInfo(PageData pageData){
		
		   /*
		      传入参数：page--当前页   limit--每页显示条数
	          需要返回对象：PageData{
		            code--请求状态，默认0为成功，
		            msg--提示信息；count--数据总条数；data---数据集合
		         }
		   */
		
		PageData page  = new PageData();
		//查询管理员数据
		try {
			List<Admin> admin = accountService.selectAdminAccount(pageData);
			
			if(admin != null){
				page.setCount(accountService.selectAdminAccountCount(pageData)); //返回数据总条数
				page.setData(admin);           //返回数据对象
				page.setCode("0");             //状态情况
			}else{
				page.setCode("1");             //状态情况
				page.setMsg("数据空空如也,嘛也没找到!");
			}
			
		} catch (Exception e) {
			page.setCode("1");
			page.setMsg("数据异常,请联系boss!");
		}
		
		return page;
	} 
	
	
//普通账号信息界面 userAccount
	//点击进入帐号信息页面
	@RequestMapping("/userAccount")
	public String userAccount(){
		return "account/userInfo";
	}
	
	//ajax 加载 帐号信息
	@RequestMapping("/userAccountInfo")
	public @ResponseBody
	PageData userAccountInfo(PageData data){
		
		PageData pageData = new PageData();
		
		//入参 page limit   返回data对象 状态 消息
		List<User>  user = accountService.selectUserAccount(data);
	
		if(user != null){
			pageData.setCount(accountService.selectUserAccountCount(data));
			pageData.setData(user);
			pageData.setCode("0");
			pageData.setMsg("数据加载成功");
		}else{
			pageData.setCode("1");
			pageData.setMsg("数据空空如也..");
		}
		
		return pageData;
	}
	
	
	//删除 单个 帐号信息
	@RequestMapping("/deleteUserById")
	public @ResponseBody 
	Integer userDelete(Integer id,@RequestParam(value = "img") String img){
		Integer a;
		try {
			a = accountService.deleteUserById(id);
			if(a != 0){
				//删除成功之后  删除对应的头像
				FileUpAndDown.deleteFile(img);
			}
		} catch (Exception e) {e.printStackTrace();
			a = 0;
		}
		return a;
	}
	
	//批量删除 帐号信息 
	@RequestMapping("/deleteUserByIds")
	public @ResponseBody 
	Integer deleteUserByIds(@RequestParam(value = "ids[]") Integer[] ids,@RequestParam(value = "img[]") String[] img){

		Integer a;
		try {
			 a = accountService.deleteUserByIds(ids);
			 if(a != 0){
					//删除成功之后  删除对应的头像
					for (int i = 0; i < img.length; i++) {
						FileUpAndDown.deleteFile(img[i]);
					}
			}
		} catch (Exception e) {e.printStackTrace();
			a = 0;
		}
		return a;
	}
	
	
	
	
	



}
