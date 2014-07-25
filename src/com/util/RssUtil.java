package com.util;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndImage;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class RssUtil {

	@SuppressWarnings("unchecked")
	public static Map<String, Object> getRSSInfo(String xmlRemotePath) {
		try {
			URL feedUrl = new URL(xmlRemotePath);
	        SyndFeedInput input = new SyndFeedInput();
	        SyndFeed feed = input.build(new XmlReader(feedUrl));
			String title = feed.getTitle();
			String link = feed.getLink();
			String description = feed.getDescription();
			String language = feed.getLanguage();
			String copyright = feed.getCopyright();
			Map<String, Object> resultMap = new HashMap<String, Object>();
			// 頻道標題
			resultMap.put("title", title);
			// 频道相关Link信息
			resultMap.put("link", link);
			resultMap.put("description", description);
			resultMap.put("language", language);
			resultMap.put("copyright", copyright);
			SyndImage syndImage = feed.getImage();
	        if(syndImage != null){
	        	resultMap.put("icon", syndImage.getUrl());
	        }else{
	        	resultMap.put("icon", "");
	        }

	        List<SyndEntry> list = feed.getEntries();
	        if(list != null && list.size() > 0){
	        	resultMap.put("itemSize", list.size());
	        	List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
	        	int i = 0;
	        	for(SyndEntry feed1 : list){
	        		int itemNo = i + 1;
					Map<String, String> map = new HashMap<String, String>();
					map.put("itemNo", itemNo + "");
					String itemAuthor = feed1.getAuthor();
					map.put("author", itemAuthor);
					String itemTitle = feed1.getTitle();
					map.put("title", itemTitle);
					String itemDescription = feed1.getDescription().getValue();
					map.put("description", itemDescription);
					String itemLink = feed1.getLink();
					map.put("link", itemLink);
					String itemPubDate = feed1.getPublishedDate().toString();
					map.put("pubDate", itemPubDate);
					resultList.add(map);
	        	}
	        	resultMap.put("list", resultList);
	        }else{
	        	resultMap.put("list", null);
	        }
	        
			return resultMap;
		} catch (Exception e) {
			Log.Error(e);
		}
		return null;

	}

	public static void main(String[] args) throws Exception {

		System.out.println(RssUtil.getRSSInfo("http://news.baidu.com/n?cmd=1&class=internews&tn=rss"));
		
	}

}
