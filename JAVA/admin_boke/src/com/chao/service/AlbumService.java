package com.chao.service;

import java.util.List;

import com.chao.pojo.Album;
import com.chao.pojo.PageData;
import com.chao.pojo.Photo;

public interface AlbumService {

	List<Album> selectAlbum(PageData pageData);

	Integer selectAlbumCount(PageData pageData);

	Album selectAlbumById(Integer id);

	Integer updateAlbumById(Album album);

	Integer insertPhotoById(Album album);

	Integer deleteAlbumById(Integer id);

	List<Photo> selectPhotoByAlbumId(Integer id);

	Integer deletePhotoByAlbumId(Integer id);

	Integer insertAlbumInfo(Album album);

	List<Photo> selectPhoto(PageData pageData);

	Integer selectPhotoCount(PageData pageData);

	Integer updateAlbumImg(Photo p);

	Integer deletePhotoById(Integer id);

	List<Album> selectAlbumByName();


}
