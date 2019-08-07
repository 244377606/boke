package com.chao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chao.mapper.AlbumDao;
import com.chao.pojo.Album;
import com.chao.pojo.PageData;
import com.chao.pojo.Photo;
import com.chao.service.AlbumService;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	AlbumDao albumDao;

	//分页查询 相册信息
	@Override
	public List<Album> selectAlbum(PageData pageData) {
		pageData.setStartPage((pageData.getPage()-1) * pageData.getLimit());
		return albumDao.selectAlbum(pageData);
	}

	//分页查询 相册总数
	@Override
	public Integer selectAlbumCount(PageData pageData) {
		return albumDao.selectAlbumCount(pageData);
	}

	//通过id 编辑相册信息
	@Override
	public Album selectAlbumById(Integer id) {
		return albumDao.selectAlbumById(id);
	}

	//修改相册信息
	@Override
	public Integer updateAlbumById(Album album) {
		return albumDao.updateAlbumById(album);
	}

	//新增照片
	@Override
	public Integer insertPhotoById(Album album) {
		return albumDao.insertPhotoById(album);
	}

	//删除相册
	@Override
	public Integer deleteAlbumById(Integer id) {
		return albumDao.deleteAlbumById(id);
	}

	//删除相册中 本地照片
	@Override
	public List<Photo> selectPhotoByAlbumId(Integer id) {
		return albumDao.selectPhotoByAlbumId(id);
	}

	//删除数据库 该相册 下的照片信息
	@Override
	public Integer deletePhotoByAlbumId(Integer id) {
		return albumDao.deletePhotoByAlbumId(id);
	}

	//新增 相册
	@Override
	public Integer insertAlbumInfo(Album album) {
		return albumDao.insertAlbumInfo(album);
	}

	//查询所有照片
	@Override
	public List<Photo> selectPhoto(PageData pageData) {
		//设置起始行
		pageData.setStartPage((pageData.getPage()-1) * pageData.getLimit());
		return albumDao.selectPhoto(pageData);
	}

	//查询照片总数
	@Override
	public Integer selectPhotoCount(PageData pageData) {
		return albumDao.selectPhotoCount(pageData);
	}

	//更新相册的封面
	@Override
	public Integer updateAlbumImg(Photo p) {
		return albumDao.updateAlbumImg(p);
	}

	//删除一张照片  
	@Override
	public Integer deletePhotoById(Integer id) {
		return albumDao.deletePhotoById(id);
	}

	//查询所有相册名称
	@Override
	public List<Album> selectAlbumByName() {
		return albumDao.selectAlbumByName();
	}

	
	
	



}
