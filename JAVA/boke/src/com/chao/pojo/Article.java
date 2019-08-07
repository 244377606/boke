package com.chao.pojo;

public class Article {

 private Integer articleId;  /* 文章id */
 private String title;       /* 标题 */
 private String author;      /* 作者 */ 
 private String content;     /* 内容 */
 private String img;         /* 文章图片 */
 private String articleTime; /* 发表时间 */ 
 
 private Integer pageView;    /* 浏览量 */
 private Integer critiques;   /* 评论次数 */
 private String articleType;  /* 文章类型 */
 
public Integer getArticleId() {
	return articleId;
}
public void setArticleId(Integer articleId) {
	this.articleId = articleId;
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
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getArticleTime() {
	return articleTime;
}
public void setArticleTime(String articleTime) {
	this.articleTime = articleTime;
}
public Integer getPageView() {
	return pageView;
}
public void setPageView(Integer pageView) {
	this.pageView = pageView;
}
public Integer getCritiques() {
	return critiques;
}
public void setCritiques(Integer critiques) {
	this.critiques = critiques;
}
public String getArticleType() {
	return articleType;
}
public void setArticleType(String articleType) {
	this.articleType = articleType;
}
@Override
public String toString() {
	return "Article [articleId=" + articleId + ", title=" + title + ", author=" + author + ", content=" + content
			+ ", img=" + img + ", articleTime=" + articleTime + ", pageView=" + pageView + ", critiques=" + critiques
			+ ", articleType=" + articleType + "]";
}
 
 
 
 
}
