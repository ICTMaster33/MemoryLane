package com.test.memory.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.memory.vo.FriendVO;
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
	
	@Override
	public boolean unregister(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.unregister(vo);
	}

	@Override
	public ArrayList<MemberVO> getList() {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.getList();
	}
	
	@Override
	public boolean click(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.click(vo);
	}
	
	@Override
	public ArrayList<MemberVO> findMember(String findId) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> list = mapper.findMember(findId); 
		return list;
	}
	
	@Override
	public boolean addFriend(FriendVO friend) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int num = mapper.addFriend(friend);
		if(num == 1){
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteFriend(FriendVO friend) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int num = mapper.deleteFriend(friend);
		if(num == 1){
			return true;
		}
		return false;
	}
	
	@Override
	public ArrayList<FriendVO> getFriendList(String loginEmail) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.getFriendList(loginEmail);
	}
}
