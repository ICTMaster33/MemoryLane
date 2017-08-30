package com.test.memory.service;

import java.util.List;

import com.test.memory.vo.DragVO;

public interface DragService {

	public void insertDrag(DragVO drag) throws Exception;

	public List<DragVO> dragList(DragVO drag) throws Exception;

	public void deleteNote(int dragNo) throws Exception;

	public DragVO selectDrag(int dragNo) throws Exception;

}
