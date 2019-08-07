package com.chao.service;

import java.util.List;

import com.chao.pojo.Album;
import com.chao.pojo.Comment;
import com.chao.pojo.Photo;
import com.chao.pojo.QueryVo;

public interface AlbumService {

	List<Album> selectAlbum();

	List<Photo> selectPhotoNew();

	List<Photo> selectPhotoByAlbumId(QueryVo vo);

	Album selectAlbumNameById(QueryVo vo);

	Integer selectPhotoNum(QueryVo vo);

	List<Comment> selectCommentNew();

}
