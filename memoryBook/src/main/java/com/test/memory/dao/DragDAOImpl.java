package com.test.memory.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.memory.vo.DragVO;

@Repository
public class DragDAOImpl implements DragDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertDrag(DragVO drag) throws Exception {
		DragMapper mapper = sqlSession.getMapper(DragMapper.class);
		mapper.insertDrag(drag);
	}

	@Override
	public List<DragVO> dragList(DragVO drag) throws Exception {
		DragMapper mapper = sqlSession.getMapper(DragMapper.class);
		return mapper.dragList(drag);
	}

	@Override
	public DragVO emailDrag(DragVO drag) throws Exception {
		DragMapper mapper = sqlSession.getMapper(DragMapper.class);
		return mapper.emailDrag(drag);
	}

	@Override
	public void deleteDrag(int dragNo) throws Exception {
		DragMapper mapper = sqlSession.getMapper(DragMapper.class);
		mapper.deleteDrag(dragNo);
	}

	@Override
	public DragVO selectDrag(int dragNo) throws Exception {
		DragMapper mapper = sqlSession.getMapper(DragMapper.class);
		return mapper.selectDrag(dragNo);
	}

	@Override
	public DragVO dragDetail(int dragNo) throws Exception {
		DragMapper mapper = sqlSession.getMapper(DragMapper.class);
		return mapper.dragDetail(dragNo);
	}
	
}
