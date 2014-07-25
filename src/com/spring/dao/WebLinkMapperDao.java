package com.spring.dao;

import com.spring.entity.WebLink;

public interface WebLinkMapperDao extends BaseDao<WebLink>{
	
	public void deleteByWebLinktype(WebLink webLink);
	
}
