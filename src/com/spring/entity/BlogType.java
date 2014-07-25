package com.spring.entity;

public class BlogType extends BaseEntity{
	
	private Integer blogTypeId;
	
	private String title;
	
	private Integer level;
	
	private Integer userId;
	
	
	public Integer getBlogTypeId() {
		return blogTypeId;
	}
	
	public String getTitle() {
		return title;
	}
	
	public Integer getLevel() {
		return level;
	}
	
	public Integer getUserId() {
		return userId;
	}
	
	
	public void setBlogTypeId(Integer blogTypeId) {
		this.blogTypeId = blogTypeId;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String toString(){
		return "BlogType";
	}
}
