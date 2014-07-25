package com.spring.service;

import com.spring.entity.Rss;

public interface RssMapperService extends BaseService<Rss>{
	
	public int addRss(String link,int rssTypeId);
	
}
