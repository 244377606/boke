package com.chao.pojo;

public class PageData {

// ========返回数据对象
	private Integer count; //返回数据的总条数
	private String msg;    //返回消息的提示信息
	private String code;   //消息的状态 默认 0 成功
	private Object data;   //返回数据对象 

// ===========传入参数 分页
	private Integer page;   //传入的当前页
	private Integer limit;   //传入的分页条数
	private Integer startPage = 0;  //查询数据库 开始位置
	
// ===========条件删选
	private String username;   //姓名查询
	private String sex;   //性别
	
	private String commentContent;   //留言内容
	private Integer commentId;   //留言id
	
	
	private String title;   //文章标题
	private String author;   //文章作者
	private String type;   //文章类型
	
	private Integer article_id;    //评论文章id
	private String user_account;  //评论帐号 
	
	private String bugError;    //bug错误信息搜索
	
	
	private String albumName;    //相册性名称查询
	
	
	
	

	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getBugError() {
		return bugError;
	}
	public void setBugError(String bugError) {
		this.bugError = bugError;
	}
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
	
}
