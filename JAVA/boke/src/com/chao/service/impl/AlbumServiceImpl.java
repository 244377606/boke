package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.AlbumDao;
import com.chao.pojo.Album;
import com.chao.pojo.Comment;
import com.chao.pojo.Photo;
import com.chao.pojo.QueryVo;
import com.chao.service.AlbumService;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	AlbumDao albumDao;
	
	//展示相册
	@Override
	public List<Album> selectAlbum() {
		return albumDao.selectAlbum();
	}

	
	//展示最新照片
	@Override
	public List<Photo> selectPhotoNew() {
		return albumDao.selectPhotoNew();
	}


	//根据照片 id 查询该相册下所有照片
	@Override
	public List<Photo> selectPhotoByAlbumId(QueryVo vo) {
		return albumDao.selectPhotoByAlbumId(vo);
	}

	//根据相册 id 查询所有照片
	@Override
	public Album selectAlbumNameById(QueryVo vo) {
		return albumDao.selectAlbumNameById(vo);
	}

	//查询相册中照片的数量
	@Override
	public Integer selectPhotoNum(QueryVo vo) {
		return albumDao.selectPhotoNum(vo);
	}

	//查询最新的留言信息
	@Override
	public List<Comment> selectCommentNew() {
		return albumDao.selectCommentNew();
	}


}
