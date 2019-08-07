package com.chao.mapper;

import java.util.List;

import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.QueryVo;
import com.chao.pojo.User;

public interface ArticleDao {

	int selectArticleCount();

	List<Article> selectArticle(QueryVo vo);

	List<Article> selectHotArticle();

	List<Article> selectNewArticle();

	Article selectArticleById(QueryVo vo);

	Article selectArticleBefore(QueryVo vo);

	Article selectArticleAfter(QueryVo vo);

	void updetePageView(QueryVo vo);

	List<Critique> selectCritiqueById(QueryVo vo);

	List<Critique> selectCritiqueAll(QueryVo vo);

	int selectCritiqueCount(QueryVo vo);

	User selectUserLogin(User user);

	void insertArticleCritique(QueryVo vo);

	void updateArticleCritiques(QueryVo vo);

	User selectAccountIsExist(User user);

	void insertUserInfo(QueryVo vo);

	void deleteCritiqueByid(Critique critique);

}
