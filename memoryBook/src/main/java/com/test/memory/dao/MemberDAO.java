package com.test.memory.dao;

import com.test.memory.vo.MemberVO;

public interface MemberDAO {
	public boolean join(MemberVO vo);
	public MemberVO login(MemberVO vo);
}
