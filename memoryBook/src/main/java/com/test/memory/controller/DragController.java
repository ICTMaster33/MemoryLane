package com.test.memory.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.memory.service.DragService;
import com.test.memory.vo.DragVO;

@RestController
@RequestMapping("/drag")
public class DragController {
	
	private FileInputStream fis;	//파일을 읽기위한
	private FileOutputStream fos;	//파일을 쓰기위한
	private ObjectInputStream ois;	//객체를 읽기위한
	private ObjectOutputStream oos;	//객체를 쓰기위한
	private String FILE_PATH = "C:/datatest/";
	private String IMG_FILE_PATH = "C:/datatest/img/";
//	private String FILE_PATH = "G:/SPRING/git/MemoryLane/drag-note/src/main/webapp/html/data/";
	
	@Autowired
	private DragService service;
	
	@RequestMapping("/registDrag")
	public Map<String, String> registDrag(HttpServletRequest request, HttpSession session) throws Exception {
		DragVO drag = new DragVO();
		byte ptext[] = request.getParameter("dragContent").getBytes();
		String value = new String(ptext, "UTF-8").replaceAll("amp;", "&");

		//drag데이터 save
		String FileName = UUID.randomUUID().toString();
			try {
				fos = new FileOutputStream(FILE_PATH + FileName);
				oos = new ObjectOutputStream(fos);
				oos.writeObject(value);
			} catch (Exception e) {
				// e.printStackTrace();
				System.out.println("[에러] 파일 쓰기에 실패했습니다.");
			} finally {
				closeStreams();
				drag.setDragContent(FileName);
			}
		
		//drag url추출부
		if(request.getParameter("dragUrl") != null) {
			drag.setDragUrl(request.getParameter("dragUrl").replaceAll("nun;", "=").replaceAll("amp;", "&"));
		}
		//회원번호 추출부
		drag.setMemberNo(Integer.parseInt(session.getAttribute("memberNo").toString()));

		service.insertDrag(drag);
		
		//이미지 저장부
		String imagePath = request.getParameter("imageTag");
		System.out.println("imagePath: "+request.getParameter("imageTag"));
		if (imagePath != null) { //드래그에 이미지가 없을 경우에는 미작동
		    BufferedImage image = null;
		    //이미지를 읽어와서 BufferedImage에 넣는다.
		    image = ImageIO.read(new URL(imagePath));
		    //파일명 자르기
		    String imgFile = imagePath.substring(imagePath.lastIndexOf("/") + 1);
		    System.out.println("imgFile: "+imgFile);
		    //확장자 자르기
		    String imgFormat = imgFile.substring(imgFile.lastIndexOf(".") + 1);
		    //파일이름 변환
		    String imgName = UUID.randomUUID().toString();
		    try {
		       // 해당경로에 이미지를 저장함.
		        	ImageIO.write(image, imgFormat, new File(IMG_FILE_PATH + imgName));
		        } catch(Exception e) {
		        	    e.printStackTrace();
		        } finally {
		        	System.out.println("정상처리완료");
		        }
		}
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
			n.setDragRegDate(cal.getTime());
		}
		
		return dragList;
	}

	@RequestMapping("/selectDrag.do")
	public DragVO selectDrag(String dragNo) throws Exception {
		DragVO n = service.selectDrag(Integer.parseInt(dragNo));
		Calendar cal = Calendar.getInstance();
		cal.setTime(n.getDragRegDate());
		n.setDragRegDate(cal.getTime());
		return n;
	}

	@RequestMapping("/deleteDrag.do")
	public Map<String, String> deleteNote(String dragNo) throws Exception {
		DragVO data = service.selectDrag(Integer.parseInt(dragNo));
		String fileName = data.getDragContent();
		service.deleteNote(Integer.parseInt(dragNo));
		File file = new File(FILE_PATH + fileName); //내용 데이터파일 경로
		if(file.exists()) file.delete(); //내용 데이터파일 삭제처리
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "드래그가 삭제 되었습니다.");
		return msg;
	}
	
	//파일 관련 스트림 close
	private void closeStreams() {
		try {
			if(fis != null) fis.close();
			if(fos != null) fos.close();
			if(ois != null) ois.close();
			if(oos != null) oos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
