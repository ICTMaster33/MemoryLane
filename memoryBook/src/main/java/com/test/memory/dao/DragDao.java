package com.test.memory.dao;

import java.util.List;

import com.test.memory.vo.DragVO;

public interface DragDao {

	public void insertDrag(DragVO drag) throws Exception;

	public List<DragVO> dragList(DragVO drag) throws Exception;

	public void deleteDrag(int dragNo) throws Exception;

	public DragVO selectDrag(int dragNo) throws Exception;
	
}
