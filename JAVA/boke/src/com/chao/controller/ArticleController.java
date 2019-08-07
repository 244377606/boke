package com.chao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.QueryVo;
import com.chao.pojo.User;
import com.chao.service.ArticleService;
import com.chao.utils.Page;

@Controller
public class ArticleController {

	@Autowired
	ArticleService articleService;
	
	//首页 展示 文章大概内容
	@RequestMapping("/index")
	public String selectArticle(QueryVo vo,Model mo){
		
		//分页查询 文章信息
		Page<Article> page =  articleService.selectByPageArticle(vo); 
		mo.addAttribute("page",page);
		
		//最热文章展示
		List<Article> hotArticle = articleService.selectHotArticle();
		mo.addAttribute("hotArticle",hotArticle);
			
		//最新文章展示
		List<Article> newArticle = articleService.selectNewArticle();
		mo.addAttribute("newArticle",newArticle);
		
		return "index";
	}
	
	
	//通过文章id 查询具体内容
	@RequestMapping("/articleDetail")
	public String articleDetail(QueryVo vo,Model mo){
		
		//实现浏览量 加1
		articleService.updetePageView(vo);
		
		//通过Id 查询 文章详细内容
		Article articleDetail = articleService.selectArticleById(vo);
		mo.addAttribute("articleDetail",articleDetail);
			
		//查询上一篇文章	
		Article articleBefore = articleService.selectArticleBefore(vo);	
		mo.addAttribute("articleBefore",articleBefore);	
		
		//查询下一篇文章
		Article articleAfter = articleService.selectArticleAfter(vo);
		mo.addAttribute("articleAfter",articleAfter);
		
		//最热文章展示
		List<Article> hotArticle = articleService.selectHotArticle();
		mo.addAttribute("hotArticle",hotArticle);
			
		//最新文章展示
		List<Article> newArticle = articleService.selectNewArticle();
		mo.addAttribute("newArticle",newArticle);
		
		return "article/articleDetail";   //返回具体的某篇文章信息
	}
	
	//评论页
	@RequestMapping("/articleCritique")
	public String articleCritique(QueryVo vo,Model mo,HttpSession session){
	
		//通过Id 查询 文章详细内容
		Article articleDetail = articleService.selectArticleById(vo);
		mo.addAttribute("articleDetail",articleDetail); //返回详细页面需要的 文章id
		
		/*通过文章 id 查询评论信息*/
		List<Critique> articleCritique = articleService.selectCritiqueById(vo);
		mo.addAttribute("articleCritique",articleCritique);
		
		//最热文章展示
		List<Article> hotArticle = articleService.selectHotArticle();
		mo.addAttribute("hotArticle",hotArticle);
			
		//最新文章展示
		List<Article> newArticle = articleService.selectNewArticle();
		mo.addAttribute("newArticle",newArticle);
		
		return "article/articleCritique";
		
	}
	
	//增加评论
	//评论页
	@RequestMapping("/insertArticleCritique")
	public String insertArticleCritique(QueryVo vo,Model mo,HttpSession session){
		
		//登录后 判断评论内容是否为空
		User user = (User) session.getAttribute("USER");
		if(vo.getCritique_content() != null && user != null){
			
			Date date = new Date(); 
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String articleTime = format.format(date);
			
			//评论的新增
			vo.setCritique_time(articleTime);
			articleService.insertArticleCritique(vo);
			
			//查询评论数量
			vo.setCritiques(articleService.selectCritiqueCount(vo));
			//评论量 加1
			articleService.updateArticleCritiques(vo);
		}
		
		return "redirect:/articleCritique?articleId="+vo.getArticleId();
	}
	
	
	
	//全部评论
	@RequestMapping("/articleCritiqueAll")
	public String articleCritiqueAll(QueryVo vo,Model mo){
		
		//分页查询 某篇文章的 所有评论
		Page<Critique> page = articleService.selectCritiqueAll(vo);	
		mo.addAttribute("page",page);
		
		Article articleDetail = articleService.selectArticleById(vo);
		mo.addAttribute("articleDetail",articleDetail); //返回详细页面需要的 文章id
			
		//最热文章展示
		List<Article> hotArticle = articleService.selectHotArticle();
		mo.addAttribute("hotArticle",hotArticle);
			
		//最新文章展示
		List<Article> newArticle = articleService.selectNewArticle();
		mo.addAttribute("newArticle",newArticle);
		
		return "article/articleCritiqueAll";
		
	}
	
	
	//删除当前 用户自己的评论
	@RequestMapping("/deleteCritiqueByid")
	public @ResponseBody
	void deleteCritiqueByid(Critique critique){
		articleService.deleteCritiqueByid(critique);
	}

	
}
