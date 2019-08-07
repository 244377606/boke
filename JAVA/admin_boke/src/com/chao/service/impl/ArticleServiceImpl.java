package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.ArticleDao;
import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.MyBug;
import com.chao.pojo.PageData;
import com.chao.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleDao articleDao;

	//查询文章
	@Override
	public List<Article> selectArticleAll(PageData data) {
		data.setStartPage((data.getPage()-1) * data.getLimit());
		return articleDao.selectArticleAll(data);
	}

	//查询文章总数
	@Override
	public Integer selectArticleCount(PageData data) {
		return articleDao.selectArticleCount(data);
	}

	//id 删除文章
	@Override
	public Integer deleteArticleById(Integer id) {
		return articleDao.deleteArticleById(id);
	}

	//查询文章 信息
	@Override
	public Article selectArticleById(Integer id) {
		return articleDao.selectArticleById(id);
	}

	//更新文章
	@Override
	public Integer updateArticle(Article article) {
		return articleDao.updateArticle(article);
	}

	//新增文章
	@Override
	public Integer insertArticle(Article article) {
		return articleDao.insertArticle(article);
	}

	//查询笔记评论信息
	@Override
	public List<Critique> selectCritique(PageData pageData) {
		pageData.setStartPage((pageData.getPage()-1) * pageData.getLimit());
		return articleDao.selectCritique(pageData);
	}

	//查询评论的数据条数
	@Override
	public Integer selectCritiqueCount(PageData pageData) {
		return articleDao.selectCritiqueCount(pageData);
	}

	//根据评论id 删除此评论
	@Override
	public Integer deleteCritiqueById(Integer id) {
		return articleDao.deleteCritiqueById(id);
	}

	//分页查询我的 bug 错误信息
	@Override
	public List<MyBug> selectMyBug(PageData pageData) {
		//设置分页信息
		pageData.setStartPage((pageData.getPage()-1) * pageData.getLimit());
		return articleDao.selectMyBug(pageData);
	}

	//查询 bug 总数
	@Override
	public Integer selectMyBugCount(PageData pageData) {
		return articleDao.selectMyBugCount(pageData);
	}

	//通过id 删除 bug
	@Override
	public Integer deleteMyBugById(Integer id) {
		return articleDao.deleteMyBugById(id);
	}

	//通过id 进入 回显 bug 编辑
	@Override
	public MyBug editMyBug(Integer id) {
		return articleDao.editMyBug(id);
	}

	//更新 bug信息
	@Override
	public Integer updateMyBug(MyBug bug) {
		return articleDao.updateMyBug(bug);
	}

	//新增 bug 信息
	@Override
	public Integer insertMyBugInfo(MyBug bug) {
		return articleDao.insertMyBugInfo(bug);
	}
	


}
