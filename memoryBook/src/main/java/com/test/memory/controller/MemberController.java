package com.test.memory.controller;

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
		public boolean login(MemberVO vo, HttpSession session, Model model) {
			model.addAttribute(vo);
			MemberVO nvo = service.login(vo); 
			if(nvo == null){
				return false;
			}
			else{
				session.setAttribute("email", nvo.getEmail());
				session.setAttribute("memberNo", nvo.getMemberNo());
				session.setAttribute("name", nvo.getName());
				return true;
			}
		}
		
		//로그아웃
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/member/main";
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
					return "main";
				}else return "redirect:/member/index";
			}else return "redirect:/member/index";
		}
		
		
		
		
		
		
		@RequestMapping(value = "login_ex", method = RequestMethod.POST)
		@ResponseBody
		public boolean login_ex(MemberVO vo, HttpSession session, Model model) {
			model.addAttribute(vo);
			if(service.login(vo) == null) return false;
			vo = service.login(vo);
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("memberNo", vo.getMemberNo());
			session.setAttribute("name", vo.getName());
			return true;
		}
}
