package kr.co.mlec.service;

import kr.co.mlec.vo.MemberVO;

public interface MemberService {

	public void join(MemberVO member)throws Exception;
	
	public void defaultFriend(MemberVO member);

	public MemberVO innerLogin(MemberVO member) throws Exception;

	public String emailCheck(String email)throws Exception;

	public MemberVO googleLogin(String email)throws Exception;

	public MemberVO memberInfo(int memberNo) throws Exception;

}

