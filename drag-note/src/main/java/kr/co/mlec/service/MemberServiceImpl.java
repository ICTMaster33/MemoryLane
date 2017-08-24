package kr.co.mlec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.dao.MemberDao;
import kr.co.mlec.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao dao;
	
	@Override
	public void join(MemberVO member) throws Exception {
		dao.insertMember(member);
	}
	@Override
	public void defaultFriend(MemberVO member) {
		dao.defaultFriend(member);
	}
	@Override
	public MemberVO innerLogin(MemberVO member) throws Exception {
		return dao.innerLogin(member);
	}
	@Override
	public String emailCheck(String email) throws Exception {
		return dao.emailCheck(email);
	}

	@Override
	public MemberVO googleLogin(String email) throws Exception {
		return dao.googleLogin(email);
	}
	@Override
	public MemberVO memberInfo(int memberNo) throws Exception {
		return dao.memberInfo(memberNo);
	}

}
