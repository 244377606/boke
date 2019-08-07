package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.ArticleDao;
import com.chao.pojo.Article;
import com.chao.pojo.Critique;
import com.chao.pojo.QueryVo;
import com.chao.pojo.User;
import com.chao.service.ArticleService;
import com.chao.utils.Page;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleDao articleDao;
	
	// 分页查询 文章大概信息
	@Override
	public Page<Article> selectByPageArticle(QueryVo vo) {
		Page<Article> page = new Page<Article>(); //创建分页对象
		
		page.setSize(vo.getSize());  //页面每页显示 连接 个数
		page.setPage(vo.getPage());  //页面当前页设置 + - 当前页会变化
		
		vo.setStartPage((vo.getPage() - 1) * vo.getSize());
		
		page.setTotal(articleDao.selectArticleCount()); //设置总条数
		page.setRows(articleDao.selectArticle(vo));
		
		return page;
	}
	
	//返回浏览量最多的文章标题
	@Override
	public List<Article> selectHotArticle() {
		return articleDao.selectHotArticle();
	}
	
	/*返回最新的文章标题  按时间倒序*/
	@Override
	public List<Article> selectNewArticle() {
		return articleDao.selectNewArticle();
	}

	//通过Id 查询具体的 某篇文章
	@Override
	public Article selectArticleById(QueryVo vo) {
		return articleDao.selectArticleById(vo);
	}

	//查询上一篇文章
	@Override
	public Article selectArticleBefore(QueryVo vo) {
		return articleDao.selectArticleBefore(vo);
	}

	//查询下一篇文章
	@Override
	public Article selectArticleAfter(QueryVo vo) {
		return articleDao.selectArticleAfter(vo);
	}

	//实现浏览量加1
	@Override
	public void updetePageView(QueryVo vo) {
		articleDao.updetePageView(vo);
		
	}

	//根据文章id 查询 账号的 信息
	@Override
	public List<Critique> selectCritiqueById(QueryVo vo) {
		return articleDao.selectCritiqueById(vo);
	}
	
	//查询评论的总条数
	@Override
	public Integer selectCritiqueCount(QueryVo vo) {
		 return articleDao.selectCritiqueCount(vo);
	}
	
	//某篇文章的全部评论
	@Override
	public Page<Critique> selectCritiqueAll(QueryVo vo) {
		
		Page<Critique> page = new Page<Critique>();
		
		page.setSize(5);
		page.setPage(vo.getPage());
		
		vo.setSize(5);
		vo.setStartPage((vo.getPage() - 1) * vo.getSize());
		
		page.setTotal(articleDao.selectCritiqueCount(vo));
		page.setRows(articleDao.selectCritiqueAll(vo));
		
		
		return page;
	}

	//判断用户是否登录
	@Override
	public User selectUserLogin(User user) {
		return articleDao.selectUserLogin(user);
	}

	//新增 某篇文章的 评论
	@Override
	public void insertArticleCritique(QueryVo vo) {
		articleDao.insertArticleCritique(vo);
		
	}
	
	//文章评论量加1
	@Override
	public void updateArticleCritiques(QueryVo vo) {
		articleDao.updateArticleCritiques(vo);
		
	}

	//判断用户名是否存在
	@Override
	public User selectAccountIsExist(User user) {
		return articleDao.selectAccountIsExist(user);
	}

	//新增帐号
	@Override
	public void insertUserInfo(QueryVo vo) {
		articleDao.insertUserInfo(vo);
		
	}

	//删除评论
	@Override
	public void deleteCritiqueByid(Critique critique) {
		articleDao.deleteCritiqueByid(critique);
		
	}

}
