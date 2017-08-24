package kr.co.mlec.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.mlec.vo.CategoryVO;
import kr.co.mlec.vo.NoteVO;

public interface NoteDao {
	
	public void insertNote(NoteVO note) throws Exception;

	public List<NoteVO> noteList(NoteVO note) throws Exception;

	public void deleteNote(int noteNo) throws Exception;

	public NoteVO noteDetail(int noteNo) throws Exception;

	public void addCategory(CategoryVO category) throws Exception;

	public List<CategoryVO> getCategory(int memberNo) throws Exception;

	public List<NoteVO> noteCartegoryList(NoteVO note) throws Exception;

	public void deleteCategory(int categoryNo) throws Exception;

	public void updateNote(NoteVO note) throws Exception;

	public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;

	public NoteVO emailNote(NoteVO note) throws Exception;

}
