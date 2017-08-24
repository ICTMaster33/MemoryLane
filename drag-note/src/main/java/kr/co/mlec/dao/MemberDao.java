package kr.co.mlec.dao;

import kr.co.mlec.vo.MemberVO;

public interface MemberDao {
	//회원가입
	public void insertMember(MemberVO member) throws Exception;
	//친구관리
	public void defaultFriend(MemberVO member);
	//로그인
	public MemberVO innerLogin(MemberVO member)throws Exception;
	//이메일 중복체크
	public String emailCheck(String email)throws Exception;
	//구글 로그인
	public MemberVO googleLogin(String email)throws Exception;
	//회원 정보
	public MemberVO memberInfo(int memberNo) throws Exception;
}
