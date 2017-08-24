package kr.co.mlec.dao;

import java.util.List;

import kr.co.mlec.vo.DragVO;

public interface DragDao {

	public void insertDrag(DragVO drag) throws Exception;

	public List<DragVO> dragList(DragVO drag) throws Exception;

	public void deleteDrag(int dragNo) throws Exception;

	public DragVO selectDrag(int dragNo) throws Exception;
	
}
