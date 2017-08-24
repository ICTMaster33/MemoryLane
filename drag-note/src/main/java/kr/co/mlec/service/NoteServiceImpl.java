package kr.co.mlec.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.dao.NoteDao;
import kr.co.mlec.vo.CategoryVO;
import kr.co.mlec.vo.NoteVO;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDao dao;

	@Override
	public int note(NoteVO note) throws Exception {
		dao.insertNote(note);
		return note.getNoteNo();
	}
	@Override
	public void noteUpdate(NoteVO note) throws Exception {
		dao.updateNote(note);
	}

	@Override
	public List<NoteVO> noteList(NoteVO note) throws Exception {
		return dao.noteList(note);
	}

	@Override
	public void deleteNote(int noteNo) throws Exception {
		dao.deleteNote(noteNo);
	}

	@Override
	public NoteVO noteDetail(int noteNo) throws Exception {
		return dao.noteDetail(noteNo);
	}

	@Override
	public List<CategoryVO> addCategory(CategoryVO category) throws Exception {
		dao.addCategory(category);
		return dao.getCategory(category.getMemberNo());

	}
	@Override
	public List<CategoryVO> getCategory(CategoryVO category) throws Exception {
		return dao.getCategory(category.getMemberNo());
	}

	@Override
	public List<NoteVO> noteCartegoryList(NoteVO note) throws Exception {
		return dao.noteCartegoryList(note);
	}

	@Override
	public void deleteCategory(int categoryNo) throws Exception {
		 dao.deleteCategory(categoryNo);
	}
	@Override
	public List<NoteVO> noteByDate(String date, int memberNo) throws Exception {
		String date1 = date + " 00:00:00";
		String date2 = date + " 23:59:59";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("memberNo", memberNo);
		return dao.noteByDate(map);
	}
	@Override
	public NoteVO emailNote(NoteVO note) throws Exception {
		return dao.emailNote(note);
	}
		
}
