package com.test.memory.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.memory.service.NoteService;
import com.test.memory.vo.CategoryVO;
import com.test.memory.vo.NoteVO;


@RestController
@RequestMapping("/note")
public class NoteController {
	
	private FileInputStream fis;	//파일을 읽기위한
	private FileOutputStream fos;	//파일을 쓰기위한
	private ObjectInputStream ois;	//객체를 읽기위한
	private ObjectOutputStream oos;	//객체를 쓰기위한
	private String FILE_PATH = "C:/data/";
//	private String FILE_PATH = "G:/SPRING/git/MemoryLane/memoryBook/src/main/webapp/data/";
	private String IMG_FILE_PATH = FILE_PATH+"img_data/"; //이미지파일 저장경로
	private String FILE_PATH_WEB = "http://localhost:8888/memory/data/img_data/"; //이미지파일 태그경로
	
	@Autowired
	private NoteService service;
	
	@RequestMapping("/note")
	public Map<String, Object> note(NoteVO note, HttpSession session) throws Exception {
		String FileName = UUID.randomUUID().toString(); //데이터 파일명 생성
		Map<String, Object> msg = new HashMap<>();
		
		//note save
		try{
			fos = new FileOutputStream(FILE_PATH + FileName);
			oos = new ObjectOutputStream(fos);
			oos.writeObject(note.getNoteContent());
		} catch(Exception e){
			// e.printStackTrace();
			System.out.println("[에러] 파일 쓰기에 실패했습니다.");
		} finally {
			note.setNoteContent(FileName); // 데이터 저장 후 내용을 파일이름으로 변경
			closeStreams();
			int noteNo = service.note(note);
			msg.put("msg", "새로운 노트가 등록되었습니다.");
			msg.put("noteNo", noteNo);
		}
		return msg;
	}
	@RequestMapping("/noteUpdate")
	public Map<String, Object> noteUpdate(NoteVO note, HttpServletRequest request, HttpSession session) throws Exception {
		String modified = UUID.randomUUID().toString(); //수정 된 파일명 생성
		Map<String, Object> msg = new HashMap<>();
		//note edit commit.
		NoteVO data = service.noteDetail(note.getNoteNo()); //원본 파일명 추출
		try{
			fos = new FileOutputStream(FILE_PATH + modified);
			oos = new ObjectOutputStream(fos);
			oos.writeObject(note.getNoteContent());
			} catch(Exception e){
				// e.printStackTrace();
				System.out.println("[에러] 파일 쓰기에 실패했습니다.");
			} finally {
				closeStreams();
				note.setNoteContent(modified); //연결파일이름을 수정된 파일명으로 설정
				service.noteUpdate(note);
				File file = new File(FILE_PATH + data.getNoteContent()); //수정 전 내용 데이터파일 경로
				if(file.exists()) file.delete(); //수정 전 내용 데이터파일 삭제처리
				msg.put("msg", "노트가 수정 되었습니다.");
				msg.put("noteNo", request.getParameter("noteNo"));
		}
		return msg;
	}
	@RequestMapping("/noteList")
	public List<NoteVO> noteList(HttpServletRequest request, HttpSession session) throws Exception {
		
		NoteVO note = new NoteVO();
		note.setMemberNo(Integer.parseInt(session.getAttribute("memberNo").toString()));
		note.setSearchWrd(request.getParameter("searchWrd"));

		List<NoteVO> noteList = service.noteList(note);
		for(NoteVO n : noteList){
			try{
				// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
				fis = new FileInputStream(FILE_PATH + n.getNoteContent());
				
				// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
				ois = new ObjectInputStream(fis);
				
				// 오브젝트 스트림으로부터 오브젝트를 읽어 String으로 형변환
				String content = (String) ois.readObject();
				n.setNoteContent(content);
				} catch(Exception e) {
					// e.printStackTrace();
					System.out.println("[에러] 파일 읽기에 실패하였습니다.");
				} finally {
					closeStreams();
			}
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getNoteRegDate());
			n.setNoteRegDate(cal.getTime());
		}
		return noteList;
	}
	@RequestMapping("/noteCartegoryList")
	public List<NoteVO> noteCartegoryList(HttpServletRequest request, HttpSession session) throws Exception {
		NoteVO note = new NoteVO();
		note.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
		note.setMemberNo(Integer.parseInt(session.getAttribute("memberNo").toString()));
		
		List<NoteVO> noteList = service.noteCartegoryList(note);
		for(NoteVO n : noteList){
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getNoteRegDate());
			n.setNoteRegDate(cal.getTime());
		}
		
		return noteList;
	}
	@RequestMapping("/noteByDate")
	public List<NoteVO> noteByDate(HttpServletRequest request, HttpSession session) throws Exception {
		String date = request.getParameter("date");
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		List<NoteVO> noteList = service.noteByDate(date, memberNo);
		for(NoteVO n : noteList){
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getNoteRegDate());
			n.setNoteRegDate(cal.getTime());
		}
		
		return noteList;
	}
	@RequestMapping("/noteDetail")
	public NoteVO noteDetail(String noteNo) throws Exception {
		NoteVO n = service.noteDetail(Integer.parseInt(noteNo));
		System.out.println(n);
		try{
			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
			fis = new FileInputStream(FILE_PATH + n.getNoteContent());
			
			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
			ois = new ObjectInputStream(fis);
			
			// 오브젝트 스트림으로부터 오브젝트를 읽어 String형으로 형변환
			String content = (String) ois.readObject();
			n.setNoteContent(content);
			} catch(Exception e) {
				// e.printStackTrace();
				System.out.println("[에러] 파일 읽기에 실패하였습니다.");
			} finally {
				closeStreams();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(n.getNoteRegDate());
		n.setNoteRegDate(cal.getTime());
		return n;
	}
	
	@RequestMapping("/deleteNote")
	public Map<String, String> deleteNote(String noteNo) throws Exception {
		//삭제부
		NoteVO data = service.noteDetail(Integer.parseInt(noteNo));
		String fileName = data.getNoteContent(); //내용 데이터파일 이름추출
		service.deleteNote(Integer.parseInt(noteNo));
		File file = new File(FILE_PATH + fileName); //내용 데이터파일 경로
		if(file.exists()) file.delete(); //내용 데이터파일 삭제처리

		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "노트가 삭제되었습니다.");
		return msg;
	}
	@RequestMapping("/deleteCategory")
	public Map<String, String> deleteCategory(String categoryNo) throws Exception {
		service.deleteCategory(Integer.parseInt(categoryNo));
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "카테고리가 삭제되었습니다.");
		return msg;
	}
	
	@RequestMapping("/addCategory")
	public Map<String, Object> addCategory(HttpServletRequest request, HttpSession session) throws Exception {
		CategoryVO category = new CategoryVO();
		category.setCategoryName(request.getParameter("categoryName"));
		category.setMemberNo(Integer.parseInt(session.getAttribute("memberNo").toString()));
		
		List<CategoryVO> categoryList = service.addCategory(category);
		Map<String, Object> msg = new HashMap<>();
		msg.put("msg", "카테고리가 추가되었습니다.");
		msg.put("categoryList", categoryList);
		return msg;
	}
	@RequestMapping("/getCategory")
	public Map<String, Object> getCategory(HttpServletRequest request, HttpSession session) throws Exception {
		CategoryVO category = new CategoryVO();
		category.setMemberNo(Integer.parseInt(session.getAttribute("memberNo").toString()));
		
		List<CategoryVO> categoryList = service.getCategory(category);
		Map<String, Object> msg = new HashMap<>();
		msg.put("categoryList", categoryList);
		return msg;
	}
	@RequestMapping("/mailNote")
	public Map<String, Object> mailNote(HttpServletRequest request, HttpSession m_session) throws Exception{
	    String emailTo = request.getParameter("emailTo");
	    int noteNo = Integer.parseInt(request.getParameter("noteNo"));
	    int memberNo = Integer.parseInt(m_session.getAttribute("memberNo").toString());
	   
	    NoteVO note = new NoteVO();
	    note.setNoteNo(noteNo);
	    note.setMemberNo(memberNo);
	    NoteVO noteVO = service.emailNote(note);
	    
	    String email = "scmtest@naver.com";
	    String title = noteVO.getNoteTitle();
	    String content = noteVO.getNoteContent();
	    
		try{
			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
			fis = new FileInputStream(FILE_PATH + content);
			
			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
			ois = new ObjectInputStream(fis);
			
			// 오브젝트 스트림으로부터 오브젝트를 읽어 String형으로 형변환
			content = (String) ois.readObject();
			} catch(Exception e) {
				// e.printStackTrace();
				System.out.println("[에러] 파일 읽기에 실패하였습니다.");
			} finally {
				closeStreams();
		}
	    
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.naver.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.quitwait", "false");
         
        Authenticator auth = new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, "13adqezc");
            }
        };
    
        Session session = Session.getDefaultInstance(props,auth);
         
        MimeMessage message = new MimeMessage(session);
        message.setSender(new InternetAddress(email));
        message.setSubject("[Memory Book] " + title);
 
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
         
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setContent(title+"<br>"+content, "text/html; charset=UTF-8");
        mp.addBodyPart(mbp1);
 
         
        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
        CommandMap.setDefaultCommandMap(mc);
         
        message.setContent(mp);
         
        Transport.send(message);
        
    	Map<String, Object> msg = new HashMap<>();
		msg.put("msg", "이메일 보내기 완료");
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
