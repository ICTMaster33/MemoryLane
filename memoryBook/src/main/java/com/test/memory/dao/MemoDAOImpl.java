package com.test.memory.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.memory.vo.MemberVO;
import com.test.memory.vo.MemoVO;






@Repository
public class MemoDAOImpl implements MemoDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MemberVO> showUserList() {
		MemoDAO mapper = sqlSession.getMapper(MemoDAO.class);
		ArrayList<MemberVO> userlist = mapper.showUserList();	
		
		return userlist;
	}

	@Override
	public void write(MemoVO memo) {
		MemoDAO mapper = sqlSession.getMapper(MemoDAO.class);
		mapper.write(memo);
	}

	@Override
	public ArrayList<MemoVO> readSentMemos(String email) {
		MemoDAO mapper = sqlSession.getMapper(MemoDAO.class);
		return mapper.readSentMemos(email);
	}

	@Override
	public ArrayList<MemoVO> readReceivedMemos(String email) {
		MemoDAO mapper = sqlSession.getMapper(MemoDAO.class);
		return mapper.readReceivedMemos(email);
	}
	
	
}
