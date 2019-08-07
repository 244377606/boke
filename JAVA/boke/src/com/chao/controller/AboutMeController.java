package com.chao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chao.pojo.MyBug;
import com.chao.pojo.QueryVo;
import com.chao.service.MyBugService;
import com.chao.utils.Page;

@Controller
public class AboutMeController {

	@Autowired
	MyBugService myBugService;
	
	//关于我页面
	@RequestMapping("/aboutMe")
	public String aboutMe(Model mo){
		
		//右边 展示前五条数据
		List<MyBug> rightBug = myBugService.selectMyBugFive();
		mo.addAttribute("rightBug",rightBug);
		
		return "aboutMe/aboutMe";
	}
	
	//我的简历页面
	@RequestMapping("/aboutResume")
	public String aboutResume(Model mo){
		
		//右边 展示前五条数据
		List<MyBug> rightBug = myBugService.selectMyBugFive();
		mo.addAttribute("rightBug",rightBug);
		
		return "aboutMe/aboutResume";
	}
	
	//我的错误集合
	@RequestMapping("/aboutMyBug")
	public String aboutMyBug(QueryVo vo,Model mo){
		
		//查询所有的bug 搜索不空 则返回错误对象
		Page<MyBug> page = myBugService.selectMyBugAll(vo);
		mo.addAttribute("page",page);
		
		//回显搜索框数据
		mo.addAttribute("bugSearch",vo.getBugSearch());
		
		
		//右边 展示前五条数据
		List<MyBug> rightBug = myBugService.selectMyBugFive();
		mo.addAttribute("rightBug",rightBug);
		
		return "aboutMe/aboutMyBug";
	}
	
	
}
