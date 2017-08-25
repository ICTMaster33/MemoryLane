package com.test.memory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.memory.dao.DragDao;
import com.test.memory.vo.DragVO;

@Service
public class DragServiceImpl implements DragService{
	
	@Autowired
	private DragDao dao;

	@Override
	public void registDrag(DragVO drag) throws Exception {
		dao.insertDrag(drag);
	}

	@Override
	public List<DragVO> dragList(DragVO drag) throws Exception {
		return dao.dragList(drag);
	}

	@Override
	public void deleteNote(int dragNo) throws Exception {
		dao.deleteDrag(dragNo);
	}

	@Override
	public DragVO selectDrag(int dragNo) throws Exception {
		return dao.selectDrag(dragNo);
	}
}
