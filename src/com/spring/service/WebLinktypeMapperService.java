package com.spring.service;

import java.util.List;

import com.spring.entity.WebLinktype;

public interface WebLinktypeMapperService extends BaseService<WebLinktype>{
	
	public List<WebLinktype> returnEntityList(WebLinktype webLinktype);
	
	public void deleteWebLinkType(WebLinktype webLinktype);
	
}
