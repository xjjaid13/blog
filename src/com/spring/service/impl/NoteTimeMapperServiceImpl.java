package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.service.impl.BaseServiceImpl;
import com.spring.dao.NoteTimeMapperDao;
import com.spring.entity.NoteTime;
import com.spring.service.NoteTimeMapperService;

@Service("noteTimeMapperService")
public class NoteTimeMapperServiceImpl extends BaseServiceImpl<NoteTime> implements NoteTimeMapperService{

	@Autowired
	NoteTimeMapperDao noteTimeMapperDao;

}
