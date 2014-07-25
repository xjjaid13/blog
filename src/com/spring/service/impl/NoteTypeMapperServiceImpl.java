package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.NoteTypeMapperDao;
import com.spring.entity.NoteType;
import com.spring.service.NoteTypeMapperService;

@Service("noteTypeMapperService")
public class NoteTypeMapperServiceImpl extends BaseServiceImpl<NoteType> implements NoteTypeMapperService{

	@Autowired
	NoteTypeMapperDao noteTypeMapperDao;

}
