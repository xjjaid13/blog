package com.spring.service.impl;

import java.util.List;
import javax.annotation.Resource;
import com.spring.dao.BaseDao;
import com.spring.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T>{

    private BaseDao<T> baseDao;
    
    @Override
    public int insert(T t) {
        return getBaseDao().insert(t);
    }

    @Override
    public int update(T t) {
        return getBaseDao().update(t);
    }

    @Override
    public int delete(T t) {
        return getBaseDao().delete(t);
    }

    @Override
    public T select(T t) {
        return getBaseDao().select(t);
    }

    @Override
    public int count(T t) {
        return getBaseDao().count(t);
    }

    @Override
    public List<T> selectList(T t) {
        return getBaseDao().selectList(t);
    }

    @Override
    public int maxId(T t) {
        return getBaseDao().maxId(t);
    }

    @Override
    public int deleteByIds(T t) {
        return getBaseDao().deleteByIds(t);
    }

    public BaseDao<T> getBaseDao() {
        return baseDao;
    }

    @Resource(name="baseDao")
    public void setBaseDao(BaseDao<T> baseDao) {
        this.baseDao = baseDao;
    }

    @Override
    public List<T> selectList(String sql, Object param) {
        return baseDao.selectList(sql, param);
    }

	@Override
	public int insertAndReturnId(T t) {
		return baseDao.insertAndReturnId(t);
	}

}
