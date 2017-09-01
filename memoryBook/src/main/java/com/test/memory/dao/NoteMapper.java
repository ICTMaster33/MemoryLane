package com.test.memory.dao;

import java.util.HashMap;
import java.util.List;

import com.test.memory.vo.CategoryVO;
import com.test.memory.vo.NoteVO;

public interface NoteMapper {
	
	public void insertNote(NoteVO note) throws Exception;

	public void updateNote(NoteVO note) throws Exception;

	public List<NoteVO> noteList(NoteVO note) throws Exception;

	public List<NoteVO> noteCartegoryList(NoteVO note) throws Exception;

	public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;

	public List<CategoryVO> getCategory(int memberNo) throws Exception;

	public void addCategory(CategoryVO category) throws Exception;
	
	public NoteVO noteDetail(int noteNo) throws Exception;
	
	public NoteVO emailNote(NoteVO note) throws Exception;

	public void deleteNote(int noteNo) throws Exception;

	public void deleteCategory(int categoryNo) throws Exception;
}
