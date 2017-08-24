package kr.co.mlec.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mlec.service.DragService;
import kr.co.mlec.vo.DragVO;
import kr.co.mlec.vo.NoteVO;

@RestController
@RequestMapping("/drag")
public class DragController {
	
	@Autowired
	private DragService service;
	
	@RequestMapping("/registDrag.do")
	public Map<String, String> registDrag(HttpServletRequest request) throws Exception {
		DragVO drag = new DragVO();
		byte ptext[] = request.getParameter("dragContent").getBytes();
		String value = new String(ptext, "UTF-8").replaceAll("amp;", "&");
		drag.setDragContent(value);
		if(request.getParameter("dragUrl") != null) {
			drag.setDragUrl(request.getParameter("dragUrl").replaceAll("nun;", "=").replaceAll("amp;", "&"));
		}
		drag.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		
		service.registDrag(drag);
		
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "새로운 드래그가 등록되었습니다.");
		return msg;
	}
	@RequestMapping("/dragList.do")
	public List<DragVO> dragList(HttpServletRequest request) throws Exception {
		DragVO drag = new DragVO();
		drag.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		drag.setSearchWrd(request.getParameter("searchWrd"));
		
		List<DragVO> dragList = service.dragList(drag);
		for(DragVO n : dragList){
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getDragRegDate());
			cal.add(Calendar.HOUR, -0);
			n.setDragRegDate(cal.getTime());
		}
		
		return dragList;
	}

	@RequestMapping("/selectDrag.do")
	public DragVO selectDrag(String dragNo) throws Exception {
		System.out.println(service.selectDrag(Integer.parseInt(dragNo)).getDragContent());
		System.out.println(service.selectDrag(Integer.parseInt(dragNo)).getDragUrl());
		
		DragVO n = service.selectDrag(Integer.parseInt(dragNo));
		Calendar cal = Calendar.getInstance();
		cal.setTime(n.getDragRegDate());
		cal.add(Calendar.HOUR, -0);
		n.setDragRegDate(cal.getTime());
		return n;
	}

	@RequestMapping("/deleteDrag.do")
	public Map<String, String> deleteNote(String dragNo) throws Exception {
		service.deleteNote(Integer.parseInt(dragNo));
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "드래그가 삭제 되었습니다.");
		return msg;
	}
}
