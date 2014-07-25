package com.spring.dao;

import java.util.List;

import com.spring.entity.WebLinktype;

public interface WebLinktypeMapperDao extends BaseDao<WebLinktype>{

	List<WebLinktype> returnEntityList(WebLinktype webLinktype);
	
}
