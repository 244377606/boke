package com.chao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.MyBug;
import com.chao.pojo.PageData;
import com.chao.service.ArticleService;
import com.chao.util.FileUpAndDown;
import com.chao.util.TimeUtil;

@Controller
public class ArticleController {

	@Autowired
	ArticleService articleService;
	
// ==============进入文章页面
	@RequestMapping("/article")
	public String article(){
		return "article/articleInfo";
	}
	
	//异步加载文章数据
	@RequestMapping("/articleInfo") 
	public @ResponseBody 
	PageData articleInfo(PageData data){
		
		List<Article> article = articleService.selectArticleAll(data);
		
		PageData pageData = new PageData();
		
		pageData.setCode("0");
		pageData.setCount(articleService.selectArticleCount(data));
		pageData.setData(article);
		
		return pageData;
	}
	
	//删除 一篇 文章
	@RequestMapping("/deleteArticleById")
	public @ResponseBody 
	Integer deleteArticleById(Integer id,String img){
		Integer num = 0;
		Integer a = articleService.deleteArticleById(id);
		
		//删除成功则删除图片
		if(a > 0){
			FileUpAndDown.deleteFile(img);
			num = a;
		}
		
		return num;
	}
	
	//进入修改文章信息页面
	@RequestMapping("/editArticle")
	public String articleDataEditById(Integer id,Model mo){
		
		Article article = articleService.selectArticleById(id);
		mo.addAttribute("article",article);
		
		return "article/editArticle";
	}
	
	//图片修改
	@RequestMapping("/updateArticleImg")
	public @ResponseBody
	PageData updateArticleImg(MultipartFile file){
		
		Integer a = 0;
		String name = null;
		
		//判断 传过来的的文件是否为空
		if(file != null){
			name = FileUpAndDown.upFile(file);
			if(name != null){
				a = 1;
			}
		}
		//返回数据对象
		PageData pageData = new PageData();
		
		pageData.setCount(a);
		pageData.setMsg(name);
		
		return pageData;
	}
	
	//修改文章
	@RequestMapping("/updateArticle")
	public @ResponseBody
	Integer updateArticle(Article article){
		
		//如果 没传新图片 ,则图片不改变
		Boolean bo = article.getImg() == null || "".equals(article.getImg());
		if(bo){
			article.setImg(article.getOldImg());
		}
		
		//设置文章的修改时间
		article.setArticleLastTime(TimeUtil.createTime());
		
		Integer a = articleService.updateArticle(article);
		
		//如果上传了新图片 则删除原来的图片 ,解除空间占用
		if(a > 0 && !bo){
			FileUpAndDown.deleteFile(article.getOldImg());
		}
		
		return a;
	}
	
    //进入新增文章页面
	@RequestMapping("/insertArticleInfo")
	public String insertArticleInfo(Article article){
		return "article/insertArticle";
	}
	
	//新增文章
	@RequestMapping("/insertArticle")
	public @ResponseBody 
	Integer insertArticle(Article article){
		
		Date date = new Date();
		String time = new SimpleDateFormat("yyyy-MM-dd").format(date);
		
		article.setArticleTime(time);
		article.setArticleLastTime(time);
		
		Integer a = articleService.insertArticle(article);
		
		return a;
	}
	
	
// =================进入文章评论页面
	@RequestMapping("/critique")
	public String critique(){
		return "article/critiqueInfo";
	}
	
	//异步回显文章评论数据
	@RequestMapping("/critiqueInfo")
	public @ResponseBody
	PageData critiqueInfo(PageData pageData){
		//传入 limit page
		PageData page = new PageData();
		
		List<Critique> critique = articleService.selectCritique(pageData);
		
		if(critique != null){
			page.setCount(articleService.selectCritiqueCount(pageData));
			page.setData(critique);
			page.setCode("0");
		}else{
			page.setCode("1");
		}
		
		return page;
	}
	
	//通过评论 id 删除 此评论
	@RequestMapping("/deleteCritiqueById")
	public @ResponseBody
	Integer deleteCritiqueById(Integer id){
		
		Integer a = articleService.deleteCritiqueById(id);
		
		return a;
	}
	
//================bug管理页面
	@RequestMapping("/myBug")
	public String myBug(){
		return "article/myBugInfo";
	}
	
	//异步加载 bug信息
	@RequestMapping("/myBugInfo")
	public @ResponseBody
	PageData myBugInfo(PageData pageData){
		PageData data = new PageData();
		
		List<MyBug> bug = articleService.selectMyBug(pageData);
		
		if(bug != null){
			data.setCode("0");
			data.setData(bug);
			data.setCount(articleService.selectMyBugCount(pageData));
		}
		return data;
	}
	
	//通过id 删除 bug
	@RequestMapping("/deleteMyBugById")
	public @ResponseBody
	Integer deleteMyBugById(Integer id){
		
		Integer a = articleService.deleteMyBugById(id);
		return a;
	}
	
	// 通过id 回显bug信息
	@RequestMapping("/editMyBug")
	public String editMyBug(Integer id,Model mo){
		
		MyBug myBug = articleService.editMyBug(id);
		mo.addAttribute("myBug",myBug);
		
		return "article/editMyBug";
	}
	
	// 编辑 bug 信息
	@RequestMapping("/updateMyBug")
	public @ResponseBody
	Integer updateMyBug(MyBug bug,Model mo){
		
		Integer a = articleService.updateMyBug(bug);
		
		return a;
	}
	
	//新增 bug 页面
	@RequestMapping("/insertMyBug")
	public String insertMyBug(){
		return "article/insertMyBug";
	}
	
	//新增bug 信息
	@RequestMapping("/insertMyBugInfo")
	public @ResponseBody 
	Integer insertMyBugInfo(MyBug bug){
		
		Integer a = articleService.insertMyBugInfo(bug);
		return a;
	}
}
