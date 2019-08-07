package com.chao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.AddArticleDao;
import com.chao.pojo.Article;
import com.chao.service.AddArticleService;

@Service
public class AddArticleServiceImpl implements AddArticleService {

	@Autowired
	AddArticleDao addArticleDao;
	
	@Override
	public void addArticle(Article article) {
		addArticleDao.addArticle(article);
	}

}
