package com.spring.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dao.BlogMapperDao;
import com.spring.entity.Blog;

@Repository
public class BlogMapperDaoImpl extends BaseDaoImpl<Blog> implements BlogMapperDao {

	@Override
	public List<Blog> returnTitleEntity(Blog blog) {
		return sqlSessionTemplate.selectList("returnTitleListEntity", blog);
	}
	
	@Override
	public List<Map<String,Object>> selectYear(Blog blog) {
		return super.sqlSessionTemplate.selectList("selectBlogYear", blog);
	}

	@Override
	public List<Map<String, Object>> selectMonth(Blog blog) {
		return super.sqlSessionTemplate.selectList("selectBlogMonth", blog);
	}

	@Override
	public List<Map<String, Object>> selectDay(Blog blog) {
		return super.sqlSessionTemplate.selectList("selectBlogDay", blog);
	}
	
}
