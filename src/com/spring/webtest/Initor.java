package com.spring.webtest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.spring.entity.User;
import com.spring.service.UserMapperService;

@SuppressWarnings("rawtypes")
@Component
public class Initor implements ApplicationListener{

	@Autowired
	private UserMapperService userMapperService;
	
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		/** 将各用户的关键词存入java缓存中 */
		List<User> userList = userMapperService.selectList(new User());
		
		for(int i = 0; userList != null && i < userList.size(); i++){
//			User user = userList.get(i);
//			BgKeyword bgKeyword = new BgKeyword();
//			bgKeyword.setUserId(user.getUserId());
//			List<BgKeyword> keywordList = bgKeywordMapperService.selectAllKeyword(bgKeyword);
//			HashMap<String,Integer> keyMap = new HashMap<String,Integer>();
//			for(int j = 0 ; keywordList != null && j < keywordList.size() ; j++){
//				bgKeyword = keywordList.get(j);
//				keyMap.put(bgKeyword.getName(), bgKeyword.getBgKeywordId());
//			}
//			Init.keywordHm.put(user.getUserId(), keyMap);
		}
	}

}
