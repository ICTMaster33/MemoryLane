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
		
		@RequestMapping(value = "login", method = RequestMethod.POST)
		@ResponseBody
		public boolean login(MemberVO vo, HttpSession session) {
			boolean result = false;
			result = service.login(vo, session);
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", vo.getName());
			return result;
		}
	
}
