package com.test.memory.service;

import java.util.ArrayList;

import com.test.memory.vo.FriendVO;
import com.test.memory.vo.MemberVO;

public interface MemberService {
	public boolean join(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public boolean unregister(MemberVO vo);
	public ArrayList<MemberVO> getList();
	public boolean click(MemberVO vo);
	public ArrayList<MemberVO> findMember(String findId);
	public boolean addFriend(FriendVO friend);
	public boolean deleteFriend(FriendVO friend);
	public ArrayList<FriendVO> getFriendList(String loginEmail);
	
}
