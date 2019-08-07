package com.chao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chao.pojo.Album;
import com.chao.pojo.Comment;
import com.chao.pojo.Photo;
import com.chao.pojo.QueryVo;
import com.chao.service.AlbumService;

@Controller
public class albumController {

	@Autowired
	AlbumService albumService;
	
	//进入相册页面
	@RequestMapping("/album")
	public String aboutMe(Model mo){
		
		//展示相册
		List<Album> album = albumService.selectAlbum();
		mo.addAttribute("album",album);
		
		
		//展示最新照片
		List<Photo> photo = albumService.selectPhotoNew();
		mo.addAttribute("photo",photo);
		 
		return "album/album";
	}
	
	
	//进入某个相册的 照片展示页面
	@RequestMapping("/albumDetail")
	public String albumDetail(Model mo,QueryVo vo){
		
		//查询相册名称
		Album albumName = albumService.selectAlbumNameById(vo);
		mo.addAttribute("albumName",albumName);
		
		//查询照片数量
		Integer photoNum = albumService.selectPhotoNum(vo);
		mo.addAttribute("photoNum",photoNum);
		
		//展示某个相册的所有照片
		List<Photo> photo = albumService.selectPhotoByAlbumId(vo);
		mo.addAttribute("photo",photo);
		
		////显示最新留言信息
		List<Comment> comment = albumService.selectCommentNew();
		mo.addAttribute("comment",comment);
		
		
		return "album/albumDetail";
	}
	
	

	
	
}