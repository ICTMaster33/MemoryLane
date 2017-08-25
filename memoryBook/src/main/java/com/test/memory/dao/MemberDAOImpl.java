package com.test.memory.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.memory.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean join(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int num = mapper.join(vo);
		if(num == 1){
			return true;
		}
		return false;
	}
	
	@Override
	public MemberVO login(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}
}
