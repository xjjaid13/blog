package com.spring.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.BaseDao;

/**
 * 基础类，封装了数据库基本操作
 * 
 * @author taylor
 * */
@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insert(T t) {
		return sqlSessionTemplate.insert("insert" + t.toString(), t);
	}

	public int update(T t) {
		return sqlSessionTemplate.update("update" + t.toString(), t);
	}

	public int delete(T t) {
		return sqlSessionTemplate.delete("delete" + t.toString(), t);
	}

	public T select(T t) {
		return sqlSessionTemplate.selectOne("select" + t.toString(), t);
	}

	public int count(T t) {
		return sqlSessionTemplate.selectOne("selectCount" + t.toString(), t);
	}

	public List<T> selectList(T t) {
		return sqlSessionTemplate.selectList("selectList" + t.toString(), t);
	}
	
	public int maxId(T t) {
		return sqlSessionTemplate.selectOne("maxId" + t.toString());
		
	}
	
	public int deleteByIds(T t){
		return sqlSessionTemplate.delete("deleteByIds" + t.toString(), t);
	}

    @Override
    public List<T> selectList(String sql, Object param) {
        return sqlSessionTemplate.selectList(sql, param);
    }

	@Override
	public int insertAndReturnId(T t) {
		sqlSessionTemplate.insert("insert" + t.toString(), t);
		return sqlSessionTemplate.selectOne("maxId" + t.toString());
	}

}
