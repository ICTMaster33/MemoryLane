package kr.co.mlec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mlec.service.MemberService;
import kr.co.mlec.vo.MemberVO;
import kr.co.mlec.vo.NoteVO;

@RestController
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;

	// 회원가입
	@RequestMapping("/join.do")
	public Map<String, String> join(HttpServletRequest request, Model model) throws Exception {
		MemberVO member = new MemberVO();
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPassword(request.getParameter("password"));
		service.join(member);
		service.defaultFriend(member);
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "회원가입이 완료되었습니다.");
		return msg;

	}
	
	// 로그인
	@RequestMapping("/login.do")
	public Map<String, Object> userLoginChk(MemberVO member) throws Exception {
		Map<String, Object> param = new HashMap<>();
		MemberVO memberVO = service.innerLogin(member);
		if (memberVO != null) {
			param.put("memberNo", memberVO.getMemberNo());
			param.put("name", memberVO.getName());
			param.put("loginChk", true);
		} else {
			param.put("loginChk", false);
		}
		return param;
	}
	// 이메일 중복 체크
	@RequestMapping("/emailCheck.do")
	public Map<String, Object> emailCheck(String email) throws Exception {
		String emailCheck = service.emailCheck(email);
		Map<String, Object> param = new HashMap<>();
		if (emailCheck != null) {
			System.out.println("사용중");
			param.put("emailChk", true);
		} else {
			System.out.println("사용가능");
			param.put("emailChk", false);
		}
		return param;
	}
	
	
	@RequestMapping("/googleLogin.do")
	public Map<String, Object> googleLogin(String email) throws Exception {
		MemberVO google = service.googleLogin(email);
		Map<String, Object> param = new HashMap<>();
		if (google != null) {
			param.put("google", true);
			param.put("memberNo", google.getMemberNo());
			param.put("name", google.getName());
		} else {
			param.put("google", false);
		}
		return param;
	}
	
	@RequestMapping("/memberInfo.do")
	public MemberVO memberInfo(String memberNo) throws Exception {
		System.out.println(Integer.parseInt(memberNo));
		return service.memberInfo(Integer.parseInt(memberNo));
	}
	
}
