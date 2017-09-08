package com.test.memory.dao;

import java.util.ArrayList;

import com.test.memory.vo.FriendVO;
import com.test.memory.vo.MemberVO;

public interface MemberMapper {
	public int join(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public boolean unregister(MemberVO vo);
	public ArrayList<MemberVO> getList();
	public boolean click(MemberVO vo);
	public ArrayList<MemberVO> findMember(String findId);
	public int addFriend(FriendVO friend);
	public int deleteFriend(FriendVO friend);
	public ArrayList<FriendVO> getFriendList(String loginEmail);
}
