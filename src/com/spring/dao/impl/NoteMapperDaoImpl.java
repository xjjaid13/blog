package com.spring.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dao.NoteMapperDao;
import com.spring.entity.Note;

@Repository
public class NoteMapperDaoImpl extends BaseDaoImpl<Note> implements NoteMapperDao {

	@Override
	public List<Map<String,Object>> selectYear(Note note) {
		return super.sqlSessionTemplate.selectList("selectYear", note);
	}

	@Override
	public List<Map<String, Object>> selectMonth(Note note) {
		return super.sqlSessionTemplate.selectList("selectMonth", note);
	}

	@Override
	public List<Map<String, Object>> selectDay(Note note) {
		return super.sqlSessionTemplate.selectList("selectDay", note);
	}

}
