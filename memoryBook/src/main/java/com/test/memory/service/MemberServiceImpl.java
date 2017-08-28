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
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}
}
