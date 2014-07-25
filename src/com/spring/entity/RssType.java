package com.spring.entity;

public class RssType extends BaseEntity{
	
	private Integer rssTypeId;
	
	private String typeName;
	
	private Integer userId;
	
	
	public Integer getRssTypeId() {
		return rssTypeId;
	}
	
	public String getTypeName() {
		return typeName;
	}
	
	public Integer getUserId() {
		return userId;
	}
	
	
	public void setRssTypeId(Integer rssTypeId) {
		this.rssTypeId = rssTypeId;
	}
	
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String toString(){
		return "RssType";
	}
}
