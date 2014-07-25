package com.spring.entity;

public class RssSubscribe extends BaseEntity{
	
	private Integer rssId;
	
	private Integer rssTypeId;
	
	
	public Integer getRssId() {
		return rssId;
	}
	
	public Integer getRssTypeId() {
		return rssTypeId;
	}
	
	
	public void setRssId(Integer rssId) {
		this.rssId = rssId;
	}
	
	public void setRssTypeId(Integer rssTypeId) {
		this.rssTypeId = rssTypeId;
	}
	
	public String toString(){
		return "RssSubscribe";
	}
}
