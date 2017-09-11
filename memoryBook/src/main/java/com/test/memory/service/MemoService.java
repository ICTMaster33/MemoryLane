package com.test.memory.service;

import java.util.ArrayList;

import com.test.memory.vo.MemberVO;
import com.test.memory.vo.MemoVO;



public interface MemoService {

	public ArrayList<MemberVO> showUserList();

	public void write(MemoVO memo);

	public ArrayList<MemoVO> readSentMemos(String email);

	public ArrayList<MemoVO> readReceivedMemos(String email);
}
