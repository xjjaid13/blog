package com.spring.dao.impl;

import org.springframework.stereotype.Repository;
import com.spring.dao.WebLinkMapperDao;
import com.spring.entity.WebLink;

@Repository
public class WebLinkMapperDaoImpl extends BaseDaoImpl<WebLink> implements WebLinkMapperDao {

	@Override
	public void deleteByWebLinktype(WebLink webLink) {
		sqlSessionTemplate.delete("deleteByWebLinktype",webLink);
	}

}
