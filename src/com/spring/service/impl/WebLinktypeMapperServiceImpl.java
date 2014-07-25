package com.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.WebLinkMapperDao;
import com.spring.dao.WebLinktypeMapperDao;
import com.spring.entity.WebLink;
import com.spring.entity.WebLinktype;
import com.spring.service.WebLinktypeMapperService;

@Service("webLinktypeMapperService")
public class WebLinktypeMapperServiceImpl extends BaseServiceImpl<WebLinktype> implements WebLinktypeMapperService{

    @Autowired
	private WebLinktypeMapperDao webLinktypeMapperDao;
    
    @Autowired
	private WebLinkMapperDao webLinkMapperDao;
	
	public List<WebLinktype> returnEntityList(WebLinktype webLinktype){
		return webLinktypeMapperDao.returnEntityList(webLinktype);
	}

	@Override
	public void deleteWebLinkType(WebLinktype webLinktype) {
		WebLink webLink = new WebLink();
		webLink.setWebLinktypeId(webLinktype.getWebLinktypeId());
		webLinkMapperDao.deleteByWebLinktype(webLink);
		webLinktypeMapperDao.delete(webLinktype);
	}

}
