package com.test.memory.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.memory.service.MemoService;
import com.test.memory.vo.MemberVO;
import com.test.memory.vo.MemoVO;



/**
 * 쪽지 보내기, 보낸 쪽지, 받은 쪽지 기능을 수행하는 컨트롤러
 */

@Controller
public class MemoController {
	
	@Autowired
	private MemoService service;
	
	/**
	 * 보내기 화면 처리
	 */
	@RequestMapping (value="send", method=RequestMethod.GET)
	public String send(Model model) {
		ArrayList<MemberVO>userlist= service.showUserList();
		model.addAttribute("userlist", userlist);
		return "send";
	}
	
	/**
	 * 쪽지 보내기 기능 처리 
	 */
	@RequestMapping (value="send", method=RequestMethod.POST)
	public String send(MemoVO memo, HttpSession session) {
		service.write(memo);
		String email = (String)session.getAttribute("email");
		memo.setFromEmail(email);
		return "redirect:sentMemos";
	}
	
	/**
	 * 보낸 쪽지 목록 처리 
	 */
	@RequestMapping (value="sentMemos", method=RequestMethod.GET)
	public String sentMemos(Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		ArrayList<MemoVO> sendList = service.readSentMemos(email);
		model.addAttribute("sendList", sendList);
 		return "sentMemos";
	}
	
	/**
	 * 받은 쪽지 목록 처리 
	 */
	@RequestMapping (value="receivedMemos", method=RequestMethod.GET)
	public String receivedMemos(Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
 		ArrayList<MemoVO> receivedList = service.readReceivedMemos(email);
 		model.addAttribute("receivedList",receivedList);
		
 		return "receivedMemos";
	}
}











