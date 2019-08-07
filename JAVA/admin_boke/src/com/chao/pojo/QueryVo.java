package com.chao.pojo;

public class QueryVo {

	//设置分页对象 所需要的 属性
	
	private Integer page = 1;
	private Integer size = 3;   //每页显示数量
	private Integer startPage;  //开始查询的位置
	private Integer count;      //数据的总条数

	
	private Integer articleId;        //文章id
	private String critique_content;  //评论内容 
	private String critique_time;      //评论时间
	private Integer critiques;        //评论量
	
	private String user_id;           //用户id 
	private String user_img;          //用户头像
	private String user_account;      //用户昵称 
	private String user_password;      //用户昵称 
	private String user_sex;           //用户性别
	private String user_time;           //用户创建时间
	
	private String bugSearch;    //bug错误搜索
	
	
	private Integer albumId;       //相册id 
	
	
	
	
	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public String getBugSearch() {
		return bugSearch;
	}

	public void setBugSearch(String bugSearch) {
		this.bugSearch = bugSearch;
	}

	public Integer getCritiques() {
		return critiques;
	}

	public void setCritiques(Integer critiques) {
		this.critiques = critiques;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_time() {
		return user_time;
	}

	public void setUser_time(String user_time) {
		this.user_time = user_time;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCritique_time() {
		return critique_time;
	}

	public void setCritique_time(String critique_time) {
		this.critique_time = critique_time;
	}

	public String getCritique_content() {
		return critique_content;
	}

	public void setCritique_content(String critique_content) {
		this.critique_content = critique_content;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
	
	
}
