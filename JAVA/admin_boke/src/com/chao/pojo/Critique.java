package com.chao.pojo;

public class Critique {
	
	// 文章评论表 critique
	
	private Integer critique_id;
	private Integer article_id;
	private Integer user_id;
	private String user_account;
	private String user_img;
	private String critique_time;
	private String critique_content;
	
	public Integer getCritique_id() {
		return critique_id;
	}
	public void setCritique_id(Integer critique_id) {
		this.critique_id = critique_id;
	}
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
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

	
	 

}
