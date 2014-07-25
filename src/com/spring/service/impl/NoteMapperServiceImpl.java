package com.spring.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.NoteMapperDao;
import com.spring.entity.Note;
import com.spring.service.NoteMapperService;

@Service
@Transactional
public class NoteMapperServiceImpl extends BaseServiceImpl<Note> implements NoteMapperService{

	@Autowired
	NoteMapperDao noteMapperDao;

	@Override
	public List<Map<String, Object>> selectYear(Note note) {
		return noteMapperDao.selectYear(note);
	}

	@Override
	public List<Map<String, Object>> selectMonth(Note note) {
		return noteMapperDao.selectMonth(note);
	}

	@Override
	public List<Map<String, Object>> selectDay(Note note) {
		return noteMapperDao.selectDay(note);
	}

}
