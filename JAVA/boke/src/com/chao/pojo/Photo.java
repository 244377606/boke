package com.chao.pojo;

public class Photo {
	//照片表
	private Integer photoId ;   		//照片id
	private Integer albumId;  			//相册id
	private String photoTime; 			//照片新增时间
	private String photoImg; 			//照片图片名称
	private String photoImgUuid; 		//图片的唯一名称
	
	
	public String getPhotoTime() {
		return photoTime;
	}
	public void setPhotoTime(String photoTime) {
		this.photoTime = photoTime;
	}
	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}
	public Integer getAlbumId() {
		return albumId;
	}
	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}
	public String getPhotoImg() {
		return photoImg;
	}
	public void setPhotoImg(String photoImg) {
		this.photoImg = photoImg;
	}
	public String getPhotoImgUuid() {
		return photoImgUuid;
	}
	public void setPhotoImgUuid(String photoImgUuid) {
		this.photoImgUuid = photoImgUuid;
	}

	
	
	
	
	
}
