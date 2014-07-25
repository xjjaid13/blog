package com.spring.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.RssMapperDao;
import com.spring.dao.RssSubscribeMapperDao;
import com.spring.dao.UserMapperDao;
import com.spring.entity.Blog;
import com.spring.entity.Rss;
import com.spring.entity.RssSubscribe;
import com.spring.entity.User;
import com.spring.service.BlogMapperService;
import com.spring.service.RssMapperService;
import com.util.RssUtil;

@Service("rssMapperService")
public class RssMapperServiceImpl extends BaseServiceImpl<Rss> implements RssMapperService{

	@Autowired
	RssMapperDao rssMapperDao;
	
	@Autowired
	RssSubscribeMapperDao rssSubscribeMapperDao;

	@Autowired
	BlogMapperService blogMapperService;

	@Autowired
	UserMapperDao userMapperDao;
	
	@Override
	public int addRss(String link, int rssTypeId) {
		link = link.trim();
		Rss rss = new Rss();
		User user = new User();
		user.setUsername("aa");
		userMapperDao.selectList(user);
//		rss.setRssTitle("aa");
//		List<Rss> rssList = rssMapperDao.selectList(rss);
//		if(rssList != null && rssList.size() > 0){
//			rss = rssList.get(0);
//			RssSubscribe rssSubscribe = new RssSubscribe();
//			rssSubscribe.setRssId(rss.getRssId());
//			rssSubscribe.setRssTypeId(rssTypeId);
//			rssSubscribeMapperDao.insert(rssSubscribe);
//		}else{
//			rss = new Rss();
//			Map<String,Object> map = RssUtil.getRSSInfo(link);
//			rss.setRssTitle(map.get("title").toString());
//			rss.setRssUrl(map.get("link").toString());
//			rss.setRssIcon(map.get("icon").toString());
//			int rssId = rssMapperDao.insertAndReturnId(rss);
//			RssSubscribe rssSubscribe = new RssSubscribe();
//			rssSubscribe.setRssId(rssId);
//			rssSubscribe.setRssTypeId(rssTypeId);
//			rssSubscribeMapperDao.insert(rssSubscribe);
//		}
		return 0;
	}

}
