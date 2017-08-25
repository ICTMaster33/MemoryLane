package com.test.memory.dao;

import com.test.memory.vo.MemberVO;

public interface MemberMapper {
	public int join(MemberVO vo);
	public MemberVO login(MemberVO vo);
}
