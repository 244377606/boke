package com.chao.service;

import java.util.List;

import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.MyBug;
import com.chao.pojo.PageData;

public interface ArticleService {

	List<Article> selectArticleAll(PageData data);

	Integer selectArticleCount(PageData data);

	Integer deleteArticleById(Integer id);

	Article selectArticleById(Integer id);

	Integer updateArticle(Article article);

	Integer insertArticle(Article article);

	List<Critique> selectCritique(PageData pageData);

	Integer selectCritiqueCount(PageData pageData);

	Integer deleteCritiqueById(Integer id);

	List<MyBug> selectMyBug(PageData pageData);

	Integer selectMyBugCount(PageData pageData);

	Integer deleteMyBugById(Integer id);

	MyBug editMyBug(Integer id);

	Integer updateMyBug(MyBug bug);

	Integer insertMyBugInfo(MyBug bug);



}
