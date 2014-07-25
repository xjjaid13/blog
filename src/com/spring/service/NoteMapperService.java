package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.entity.Note;

public interface NoteMapperService extends BaseService<Note>{
	
	public List<Map<String,Object>> selectYear(Note note);
	
	public List<Map<String,Object>> selectMonth(Note note);
	
	public List<Map<String,Object>> selectDay(Note note);
	
}
