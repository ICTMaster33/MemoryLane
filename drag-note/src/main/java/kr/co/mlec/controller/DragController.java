package kr.co.mlec.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	
	private FileInputStream fis;	//파일을 읽기위한
	private FileOutputStream fos;	//파일을 쓰기위한
	private ObjectInputStream ois;	//객체를 읽기위한
	private ObjectOutputStream oos;	//객체를 쓰기위한
	private String FILE_PATH = "c:/test/";
	
	@Autowired
	private DragService service;
	
	@RequestMapping("/registDrag.do")
	public Map<String, String> registDrag(HttpServletRequest request) throws Exception {
		DragVO drag = new DragVO();
		byte ptext[] = request.getParameter("dragContent").getBytes();
		String value = new String(ptext, "UTF-8").replaceAll("amp;", "&");
		
		//drag save
		String FileName = UUID.randomUUID().toString();
		try{
			fos = new FileOutputStream(FILE_PATH + FileName);
			oos = new ObjectOutputStream(fos);
			oos.writeObject(value);
		} catch(Exception e){
			// e.printStackTrace();
			System.out.println("[에러] 파일 쓰기에 실패했습니다.");
		} finally {
			closeStreams();
			drag.setDragContent(FileName);
		}
		
		//drag url
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
			try{
			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
			fis = new FileInputStream("c:/test/"+n.getDragContent());
			
			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
			ois = new ObjectInputStream(fis);
			
			// 오브젝트 스트림으로부터 오브젝트를 읽어 ArrayList<Human>으로 형변환
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
			cal.add(Calendar.HOUR, -0);
			n.setDragRegDate(cal.getTime());
		}
		
		return dragList;
	}

	@RequestMapping("/selectDrag.do")
	public DragVO selectDrag(String dragNo) throws Exception {
		
		DragVO n = service.selectDrag(Integer.parseInt(dragNo));
		Calendar cal = Calendar.getInstance();
		cal.setTime(n.getDragRegDate());
		cal.add(Calendar.HOUR, -0);
		n.setDragRegDate(cal.getTime());
		return n;
	}

	@RequestMapping("/deleteDrag.do")
	public Map<String, String> deleteNote(String dragNo) throws Exception {
		//삭제부
		DragVO data = service.selectDrag(Integer.parseInt(dragNo));
		String fileName = data.getDragContent(); //내용 데이터파일 이름추출
		service.deleteNote(Integer.parseInt(dragNo)); //DB처리
		File file = new File(FILE_PATH + fileName); //내용 데이터파일 경로
		if(file.exists()) file.delete(); //내용 데이터파일 삭제처리
		//메세지출력
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
