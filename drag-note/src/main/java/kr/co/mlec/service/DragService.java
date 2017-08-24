package kr.co.mlec.service;

import java.util.List;

import kr.co.mlec.vo.DragVO;

public interface DragService {

	public void registDrag(DragVO drag) throws Exception;

	public List<DragVO> dragList(DragVO drag) throws Exception;

	public void deleteNote(int dragNo) throws Exception;

	public DragVO selectDrag(int dragNo) throws Exception;

}
