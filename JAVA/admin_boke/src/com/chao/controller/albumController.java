package com.chao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chao.pojo.Album;
import com.chao.pojo.PageData;
import com.chao.pojo.Photo;
import com.chao.service.AlbumService;
import com.chao.util.FileUpAndDown;
import com.chao.util.TimeUtil;

@Controller
public class albumController {

	@Autowired
	AlbumService albumService;

	//进入相册页面
	@RequestMapping("/album")
	public String album(){
		return "album/albumInfo";
	}
	 
	//异步加载相册信息
	@RequestMapping("/albumInfo")
	public @ResponseBody
	PageData albumInfo(PageData pageData){
		
		PageData page = new PageData();
		
		List<Album> album = albumService.selectAlbum(pageData);
		
		if(album != null){
			page.setCode("0");
			page.setCount(albumService.selectAlbumCount(pageData));
			page.setData(album);
		}
		
		return page;
	}

// ======= 进入新增相册页面
	@RequestMapping("/insertAlbum")
	public String insertAlbum(Model mo){
		return "album/insertAlbum";
	}
	//新增相册信息
	@RequestMapping("/insertAlbumInfo")
	public @ResponseBody 
	Integer insertAlbumInfo(Album album){
		
		//设置相册创建时间
		String time = TimeUtil.createTime();
		
		album.setAlbumTime(time);
		
		Integer a = albumService.insertAlbumInfo(album);
		
		//将封面照片 加入 此相册
		if(a > 0){
			if(album.getAlbumImg() != null){
				
				album.setAlbumTime(time);
				albumService.insertPhotoById(album);
			}
		}
		
		return a;
	}
	
	
	
	//进入编辑 相册
	@RequestMapping("/editAlbum")
	public String editAlbum(Integer id,Model mo){
		
		//通过id查询相册信息
		Album album = albumService.selectAlbumById(id);
		mo.addAttribute("album",album);
		
		return "album/editAlbum";
	}
	
	//图片修改 
	@RequestMapping("/updateAlbumImg")
	public @ResponseBody
	PageData updateAlbumImg(MultipartFile file){
		
		Integer a = 0;
		String name = null;
		
		//判断 传过来的的文件是否为空
		if(file != null){
			name = FileUpAndDown.upFile(file);
			if(name != null){
				a = 1;
			}
		}
		//返回数据对象
		PageData pageData = new PageData();
		
		pageData.setCount(a);
		pageData.setMsg(name);
		
		return pageData;
	}
	
	//修改相册信息
	@RequestMapping("/updateAlbumById")
	public @ResponseBody
	Integer updateAlbumById(Album album){
		
		Integer a  = albumService.updateAlbumById(album);
		
		//新图片不为空 则讲此图片加入相册
		if(album.getAlbumImg() != null){
			album.setAlbumTime(TimeUtil.createTime());
			albumService.insertPhotoById(album);
		}
		
		return a;
	}
	
	//删除 相册
	@RequestMapping("/deleteAlbumById")
	public @ResponseBody
	Integer deleteAlbumById(Integer id){
		
		Integer a = albumService.deleteAlbumById(id);
		
		//删除该相册下的所有照片
		if(a > 0){
			
			// 删除本地照片
			List<Photo> o = albumService.selectPhotoByAlbumId(id);
			for (Photo photo : o) {
				FileUpAndDown.deleteFile(photo.getPhotoImg());
			}
			
			// 删除数据库照片信息
			albumService.deletePhotoByAlbumId(id);
		}
		
		return a;
	}
	
	//进入增加照片页面
	@RequestMapping("/insertPhotos")
	public String insertPhotos(Integer id,String name,Model mo){
		
		mo.addAttribute("albumId",id);
		mo.addAttribute("albumTitle",name);
		return "album/insertPhoto";
	}
	
	//为该相册增加照片
	@RequestMapping("/insertPhotoForAlbum")
	public @ResponseBody
	Integer insertPhotoForAlbum(Album album,MultipartFile file){
		Integer a = 0;
		if(file != null){
			String name = FileUpAndDown.upFile(file);
			
			//新增照片
			album.setAlbumTime(TimeUtil.createTime());
			album.setAlbumImg(name);
			a = albumService.insertPhotoById(album);
		}
		return a;
	}
	
	
	//进入所有照片
	@RequestMapping("/photoShow")
	public String photoShow(Model mo){
		
		//查询相册名称
		List<Album> name = albumService.selectAlbumByName();
		mo.addAttribute("albumName",name);
		
		return "album/photoInfo";
	}
	
	//展示所有照片
	@RequestMapping("/photoInfo")
	public @ResponseBody 
	PageData photoInfo(PageData pageData){
		
		PageData page = new PageData();
		List<Photo> photo = albumService.selectPhoto(pageData);
		if(photo != null){
			page.setCode("0");
			page.setCount(albumService.selectPhotoCount(pageData));
			page.setData(photo);
		}
		return page;
	}
	
	//将照片设置为相册封面
	@RequestMapping("/updateAlbumImgByPhotoId")
	public @ResponseBody
	Integer updateAlbumImg(Photo p){
		
		Integer a = albumService.updateAlbumImg(p);
		return a;
	}
	
	
	//删除一张照片
	@RequestMapping("/deletePhotoById")
	public @ResponseBody
	Integer deletePhotoById(Integer id){
		
		Integer a = albumService.deletePhotoById(id);
		return a;
	}
}