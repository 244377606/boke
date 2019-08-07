package com.chao.pojo;

public class Album {
	//相册表
	private Integer albumId;  		//相册id
	private String albumTitle; 		//相册的名称
	private String albumImg; 		//相册首张照片
	private String albumType; 		//相册的类型
	private String albumTime; 		//相册创建时间
	private String albumDescribe; 	//相册的描述
	
	
	public Integer getAlbumId() {
		return albumId;
	}
	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}
	public String getAlbumTitle() {
		return albumTitle;
	}
	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}
	public String getAlbumImg() {
		return albumImg;
	}
	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
	}
	public String getAlbumType() {
		return albumType;
	}
	public void setAlbumType(String albumType) {
		this.albumType = albumType;
	}
	public String getAlbumTime() {
		return albumTime;
	}
	public void setAlbumTime(String albumTime) {
		this.albumTime = albumTime;
	}
	public String getAlbumDescribe() {
		return albumDescribe;
	}
	public void setAlbumDescribe(String albumDescribe) {
		this.albumDescribe = albumDescribe;
	}
	
}
