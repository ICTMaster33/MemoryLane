package com.test.memory.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.test.memory.vo.MemberVO;

public interface MemberService {
	public boolean join(MemberVO vo);
	public boolean login(MemberVO vo, HttpSession session);
}
