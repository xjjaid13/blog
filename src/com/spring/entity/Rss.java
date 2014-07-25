package com.spring.entity;

public class Rss extends BaseEntity{
	
	private Integer rssId;
	
	private String rssTitle;
	
	private String rssUrl;
	
	private String rssIcon;
	
	
	public Integer getRssId() {
		return rssId;
	}
	
	public String getRssTitle() {
		return rssTitle;
	}
	
	public String getRssUrl() {
		return rssUrl;
	}
	
	public String getRssIcon() {
		return rssIcon;
	}
	
	
	public void setRssId(Integer rssId) {
		this.rssId = rssId;
	}
	
	public void setRssTitle(String rssTitle) {
		this.rssTitle = rssTitle;
	}
	
	public void setRssUrl(String rssUrl) {
		this.rssUrl = rssUrl;
	}
	
	public void setRssIcon(String rssIcon) {
		this.rssIcon = rssIcon;
	}
	
	public String toString(){
		return "Rss";
	}
}
