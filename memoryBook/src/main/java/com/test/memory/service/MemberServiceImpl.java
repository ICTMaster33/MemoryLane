package com.test.memory.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.memory.dao.MemberDAO;
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
	public boolean login(MemberVO vo, HttpSession session) {
		MemberVO vo2 = dao.login(vo);
		if(vo2 == null) return false;
		return true;
	}
}
