package com.test.memory.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.memory.dao.MemoDAO;
import com.test.memory.vo.MemberVO;
import com.test.memory.vo.MemoVO;




@Service
public class MemoServiceImpl implements MemoService{
	@Autowired
	private MemoDAO dao;

	@Override
	public ArrayList<MemberVO> showUserList() {
		return dao.showUserList();
	}

	@Override
	public void write(MemoVO memo) {
		dao.write(memo);
	}

	@Override
	public ArrayList<MemoVO> readSentMemos(String email) {
		return dao.readSentMemos(email);
	}

	@Override
	public ArrayList<MemoVO> readReceivedMemos(String email) {
		return dao.readReceivedMemos(email);
	}

	

	
	
	
}
