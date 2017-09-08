package com.test.memory.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.memory.service.DragService;
import com.test.memory.vo.DragVO;

import net.sf.json.JSONArray;


@RestController
@RequestMapping("/drag")
public class DragController {
	
	private FileInputStream fis;	//파일을 읽기위한 스트림
	private FileOutputStream fos;	//파일을 쓰기위한 스트림
	private ObjectInputStream ois;	//객체를 읽기위한 스트림
	private ObjectOutputStream oos;	//객체를 쓰기위한 스트림
	private ArrayList<String> IMG_REF = new ArrayList<>(); //이미지 경로를 저장하는 배열변수
	private ArrayList<String> IMG_FILE = new ArrayList<>(); //이미지 파일명을 저장하는 배열변수
	private String FILE_PATH = "C:/Users/SCitmaster/git/MemoryLane/memoryBook/src/main/webapp/data/";
//	private String FILE_PATH = "G:/SPRING/git/MemoryLane/drag-note/src/main/webapp/html/data/";
	private String IMG_FILE_PATH = FILE_PATH+"img_data/"; //이미지파일 저장경로
	private String FILE_PATH_WEB = "http://localhost:8888/memory/data/"; //데이터 태그경로
	private String IMG_FILE_PATH_WEB = FILE_PATH_WEB+"img_data/"; //이미지파일 태그경로
	
	@Autowired
	private DragService service;
	
	@RequestMapping("/registDrag")
	public Map<String, String> registDrag(DragVO drag, HttpSession session) throws Exception {
		// 태그 저장부
		byte ptext[] = drag.getDragContent().getBytes();
		String value = new String(ptext, "UTF-8").replaceAll("amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">");

		// 이미지 추출부
		Pattern p = Pattern.compile("<img\\s+([a-zA-Z0-9]+\\s*=\\s*\"?.*?)?\\s*src\\s*=\\s*\"?(.*?)[\"|>]", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(value);
		while(m.find()) { 
			System.out.println("결과: "+m.group(2));
			String imagePath = m.group(2); // img 태그내 src값 추출결과
			// 이미지를 읽어와서 BufferedImage에 넣는다.
			BufferedImage image = ImageIO.read(new URL(imagePath));

			// 파일명 자르기
			String imgFile = imagePath.substring(imagePath.lastIndexOf("/") + 1);
			System.out.println(imgFile);

			// 확장자 자르기
			String imgFormat = imgFile.substring(imgFile.lastIndexOf(".") + 1);

			// 파일이름 변환
			String imgName = UUID.randomUUID().toString();
//			String imgName = imgFile;

			// 해당경로에 이미지를 저장함.
			try {
				ImageIO.write(image, imgFormat, new File(IMG_FILE_PATH + imgName));
			} catch (Exception e) { // 오류발생시 취소하면서 이미 저장된 이미지파일 및 리스트 삭제
				//e.printStackTrace();
				for (int i = 0; i < IMG_FILE.size(); i++) {
					File file = new File(FILE_PATH + IMG_FILE.get(i)); //내용 데이터파일 경로
					if(file.exists()) file.delete(); //내용 데이터파일 삭제처리
				}
				IMG_REF.clear();
				IMG_FILE.clear();
				System.out.println("[에러] 이미지파일 저장 실패");
			} finally {
				IMG_REF.add(imagePath);
				IMG_FILE.add(imgName);
			}
		}
		
		// 이미지태그 경로 변환부 (img태그가 있는 경우에만 작동)
		if (!IMG_REF.isEmpty()) {
			for (int i = 0; i < IMG_REF.size(); i++) {
				value = value.replaceAll(IMG_REF.get(i), IMG_FILE_PATH_WEB + IMG_FILE.get(i));
			}
		}

		// drag데이터 save
		String FileName = UUID.randomUUID().toString();
		try {
			fos = new FileOutputStream(FILE_PATH + FileName);
			oos = new ObjectOutputStream(fos);
			System.out.println("value: " + value);
			oos.writeObject(value);
		} catch (Exception e) { // 오류발생시 취소하면서 저장된 데이터 및 리스트 삭제
			// e.printStackTrace();
			for (int i = 0; i < IMG_FILE.size(); i++) {
				File img_File = new File(FILE_PATH + IMG_FILE.get(i)); //이미지 데이터파일 경로
				if(img_File.exists()) img_File.delete(); //해당 이미지파일 삭제처리
			}
			File data_File = new File(FILE_PATH + FileName); //내용 데이터파일 경로
			if(data_File.exists()) data_File.delete(); //해당 데이터파일 삭제처리
			IMG_FILE.clear();
			IMG_REF.clear();
			System.out.println("[에러] 데이터 파일 쓰기 실패");
		} finally {
			closeStreams();
			drag.setDragContent(FileName);
			System.out.println("저장완료");
		}

		// drag url추출부
		if (drag.getDragUrl() != null) {
			drag.setDragUrl(drag.getDragUrl().replaceAll("nun;", "=").replaceAll("amp;", "&"));
		} else {
			drag.setDragUrl("none");
		}

		// 회원번호 추출부
		drag.setMemberNo(Integer.parseInt(session.getAttribute("memberNo").toString()));

		// DB저장부
		service.insertDrag(drag);

		// 이미지 리스트 초기화
		IMG_FILE.clear();
		IMG_REF.clear();

		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "새로운 드래그가 등록되었습니다.");
		return msg;
	}
	
	@RequestMapping("/dragList")
	public List<DragVO> dragList(HttpServletRequest request) throws Exception {
		DragVO drag = new DragVO();
		drag.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		drag.setSearchWrd(request.getParameter("searchWrd"));
		
		List<DragVO> dragList = service.dragList(drag);
		for(DragVO n : dragList){
			try{
				// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
				fis = new FileInputStream(FILE_PATH + n.getDragContent());
				
				// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
				ois = new ObjectInputStream(fis);
				
				// 오브젝트 스트림으로부터 오브젝트를 읽어 String으로 형변환
				String content = (String) ois.readObject();
				n.setDragContent(content);
				} catch(Exception e) {
					// e.printStackTrace();
					System.out.println("[에러] 파일 읽기에 실패하였습니다.");
				} finally {
					closeStreams();
			}
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getDragRegDate());
			n.setDragRegDate(cal.getTime());
		}
		
		return dragList;
	}

	@RequestMapping("/selectDrag")
	public DragVO selectDrag(String dragNo) throws Exception {
		DragVO n = service.selectDrag(Integer.parseInt(dragNo));
		try{
			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
			fis = new FileInputStream(FILE_PATH + n.getDragContent());
			
			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
			ois = new ObjectInputStream(fis);
			
			// 오브젝트 스트림으로부터 오브젝트를 읽어 String으로 형변환
			String content = (String) ois.readObject();
			n.setDragContent(content);
			} catch(Exception e) {
				// e.printStackTrace();
				System.out.println("[에러] 파일 읽기에 실패하였습니다.");
			} finally {
				closeStreams();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(n.getDragRegDate());
		n.setDragRegDate(cal.getTime());
		return n;
	}

	@RequestMapping("/deleteDrag")
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
