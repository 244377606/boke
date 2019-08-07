package com.chao.service;

import java.util.List;

import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.QueryVo;
import com.chao.pojo.User;
import com.chao.utils.Page;

public interface ArticleService {

	Page<Article> selectByPageArticle(QueryVo vo);

	List<Article> selectHotArticle();

	List<Article> selectNewArticle();

	Article selectArticleById(QueryVo vo);

	Article selectArticleBefore(QueryVo vo);

	Article selectArticleAfter(QueryVo vo);

	void updetePageView(QueryVo vo);

	List<Critique> selectCritiqueById(QueryVo vo);

	Page<Critique> selectCritiqueAll(QueryVo vo);

	User selectUserLogin(User user);

	void insertArticleCritique(QueryVo vo);

	void updateArticleCritiques(QueryVo vo);

	User selectAccountIsExist(User user);

	void insertUserInfo(QueryVo vo);

	Integer selectCritiqueCount(QueryVo vo);

	void deleteCritiqueByid(Critique critique);

}
