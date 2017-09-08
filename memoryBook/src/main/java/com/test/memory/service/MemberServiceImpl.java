package com.test.memory.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.memory.dao.MemberDAO;
import com.test.memory.vo.FriendVO;
import com.test.memory.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	
	@Override
	public boolean join(MemberVO vo) {
		return dao.join(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}
	
	@Override
	public boolean unregister(MemberVO vo) {
		return dao.unregister(vo);
	}

	@Override
	public ArrayList<MemberVO> getList() {
		
		return dao.getList();
		
	}

	@Override
	public boolean click(MemberVO vo) {
		
		return dao.click(vo);
	}
	
	@Override
	public ArrayList<MemberVO> findMember(String findId) {
		return dao.findMember(findId);
	}
	
	@Override
	public boolean addFriend(FriendVO friend) {
		return dao.addFriend(friend);
	}
	
	@Override
	public boolean deleteFriend(FriendVO friend) {
		return dao.deleteFriend(friend);
	}
	
	@Override
	public ArrayList<FriendVO> getFriendList(String loginEmail) {
		return dao.getFriendList(loginEmail);
	}
}
