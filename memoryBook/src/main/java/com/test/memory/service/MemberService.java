package com.test.memory.service;

import com.test.memory.vo.MemberVO;

public interface MemberService {
	public boolean join(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public boolean unregister(MemberVO vo);
}
