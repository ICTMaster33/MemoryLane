package com.test.memory.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.memory.service.MemberService;
import com.test.memory.vo.FriendVO;
import com.test.memory.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
		@RequestMapping(value = "join", method = RequestMethod.POST)
		@ResponseBody
		public boolean join(MemberVO vo) {
			return service.join(vo);
		}
		
		@RequestMapping(value = "index", method = RequestMethod.GET)
		public String index() {
			return "/index"; 
		}
		
		@RequestMapping(value = "main", method = RequestMethod.GET)
		public String main() {
			return "main"; 
		}
		
		@RequestMapping(value = "login", method = RequestMethod.POST)
		@ResponseBody
		public String login(MemberVO vo, HttpSession session, Model model) {
			model.addAttribute(vo);
			MemberVO nvo = service.login(vo); 
			if(nvo == null){
				return "false";
			}
			else if(nvo.getApprovalNum()==1){
				return "stop";
			}
			else{
				session.setAttribute("email", nvo.getEmail());
				session.setAttribute("memberNo", nvo.getMemberNo());
				session.setAttribute("name", nvo.getName());
				return "true";
			}
		}
		
		//로그아웃
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
		//회원탈퇴
		@RequestMapping(value = "unregister", method = RequestMethod.POST)
		public String unregister(MemberVO vo, HttpSession session, Model model) {
			String loginEmail = (String)session.getAttribute("email");
			boolean checkResult = loginEmail.equals(vo.getEmail());
			System.out.println(checkResult);
			model.addAttribute("checkResult", checkResult);
			if(checkResult){
				boolean unregiResult = service.unregister(vo);
				model.addAttribute("unregiResult", unregiResult);
				if(unregiResult){
					session.invalidate();
					return "redirect:/";
				}else return "redirect:/member/index";
			}else return "redirect:/member/index";
		}
		//리스트 출력
		@RequestMapping(value = "getList", method = RequestMethod.GET)
		@ResponseBody
		public ArrayList<MemberVO> getList() {
			return service.getList();
		}
		//정지 해제
		@RequestMapping(value = "click")
		@ResponseBody
		public boolean click(MemberVO vo) {
		
			return service.click(vo);
		}
		
		//멤버찾기
		@RequestMapping(value = "findMember", method = RequestMethod.POST)
		@ResponseBody
		public ArrayList<MemberVO> findMember(String findId, Model model) {
//					String loginEmail = (String)session.getAttribute("email");
			return service.findMember(findId);
		}
		
		//친구추가
		@RequestMapping(value = "addFriend", method = RequestMethod.POST)
		@ResponseBody
		public boolean addFriend(FriendVO friend) {
			return service.addFriend(friend);
		}
		
		//친구삭제
		@RequestMapping(value = "deleteFriend", method = RequestMethod.POST)
		@ResponseBody
		public boolean deleteFriend(FriendVO friend) {
			return service.deleteFriend(friend);
		}
		
		//친구목록불러오기
		@RequestMapping(value = "getFriendList", method = RequestMethod.POST)
		@ResponseBody
		public ArrayList<FriendVO> getFriendList(HttpSession session, Model model) {
			String loginEmail = (String)session.getAttribute("email");
			return service.getFriendList(loginEmail);
		}

				
}
