package com.spring.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.spring.dao.WebLinktypeMapperDao;
import com.spring.entity.WebLinktype;

@Repository
public class WebLinktypeMapperDaoImpl extends BaseDaoImpl<WebLinktype> implements WebLinktypeMapperDao {

	public List<WebLinktype> returnEntityList(WebLinktype webLinktype){
		return sqlSessionTemplate.selectList("returnEntityList",webLinktype);
	}
	
}
