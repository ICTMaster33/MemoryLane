package com.test.memory.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.memory.vo.CategoryVO;
import com.test.memory.vo.NoteVO;

@Repository
public class NoteDAOImpl implements NoteDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNote(NoteVO note) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		mapper.insertNote(note);	
	}

	@Override
	public void updateNote(NoteVO note) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		mapper.updateNote(note);	
	}

	@Override
	public List<NoteVO> noteList(NoteVO note) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		return mapper.noteList(note);
	}

	@Override
	public List<NoteVO> noteCartegoryList(NoteVO note) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		return mapper.noteCartegoryList(note);
	}

	@Override
	public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		return mapper.noteByDate(map);
	}

	@Override
	public List<CategoryVO> getCategory(int memberNo) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		return mapper.getCategory(memberNo);
	}

	@Override
	public void addCategory(CategoryVO category) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		mapper.addCategory(category);	
	}

	@Override
	public NoteVO noteDetail(int noteNo) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		return mapper.noteDetail(noteNo);
	}

	@Override
	public NoteVO emailNote(NoteVO note) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		return mapper.emailNote(note);
	}

	@Override
	public void deleteNote(int noteNo) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		mapper.deleteNote(noteNo);	
	}

	@Override
	public void deleteCategory(int categoryNo) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		mapper.deleteCategory(categoryNo);	
	}
	
}
