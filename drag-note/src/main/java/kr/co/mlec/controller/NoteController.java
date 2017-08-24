package kr.co.mlec.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mlec.service.NoteService;
import kr.co.mlec.vo.CategoryVO;
import kr.co.mlec.vo.NoteVO;


@RestController
@RequestMapping("/note")
public class NoteController {
	
	@Autowired
	private NoteService service;
	
	@RequestMapping("/note.do")
	public Map<String, Object> note(HttpServletRequest request) throws Exception {
		NoteVO note = new NoteVO();
		note.setNoteTitle(request.getParameter("noteTitle"));
		note.setNoteContent(request.getParameter("noteContent"));
		note.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		note.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
		
		int noteNo = service.note(note);
		
		Map<String, Object> msg = new HashMap<>();
		msg.put("msg", "새로운 노트가 등록되었습니다.");
		msg.put("noteNo", noteNo);
		return msg;
	}
	@RequestMapping("/noteUpdate.do")
	public Map<String, Object> noteUpdate(HttpServletRequest request) throws Exception {
		NoteVO note = new NoteVO();
		note.setNoteTitle(request.getParameter("noteTitle"));
		note.setNoteContent(request.getParameter("noteContent"));
		note.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		note.setNoteNo(Integer.parseInt(request.getParameter("noteNo")));
		note.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
		
		
		service.noteUpdate(note);
		Map<String, Object> msg = new HashMap<>();
		msg.put("msg", "노트가 수정 되었습니다.");
		msg.put("noteNo", request.getParameter("noteNo"));
		return msg;
	}
	@RequestMapping("/noteList.do")
	public List<NoteVO> noteList(HttpServletRequest request) throws Exception {
		
		NoteVO note = new NoteVO();
		note.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		note.setSearchWrd(request.getParameter("searchWrd"));

		List<NoteVO> noteList = service.noteList(note);
		for(NoteVO n : noteList){
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getNoteRegDate());
			n.setNoteRegDate(cal.getTime());
		}
		return noteList;
		
	}
	@RequestMapping("/noteCartegoryList.do")
	public List<NoteVO> noteCartegoryList(HttpServletRequest request) throws Exception {
		NoteVO note = new NoteVO();
		note.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
		note.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		
		List<NoteVO> noteList = service.noteCartegoryList(note);
		for(NoteVO n : noteList){
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getNoteRegDate());
			n.setNoteRegDate(cal.getTime());
		}
		
		return noteList;
	}
	@RequestMapping("/noteByDate.do")
	public List<NoteVO> noteByDate(HttpServletRequest request) throws Exception {
		String date = request.getParameter("date");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		List<NoteVO> noteList = service.noteByDate(date, memberNo);
		for(NoteVO n : noteList){
			Calendar cal = Calendar.getInstance();
			cal.setTime(n.getNoteRegDate());
			n.setNoteRegDate(cal.getTime());
		}
		
		return noteList;
	}
	@RequestMapping("/noteDetail.do")
	public NoteVO noteDetail(String noteNo) throws Exception {
		NoteVO n = service.noteDetail(Integer.parseInt(noteNo));
		System.out.println(n);
		Calendar cal = Calendar.getInstance();
		cal.setTime(n.getNoteRegDate());
		n.setNoteRegDate(cal.getTime());
		return n;
	}
	
	@RequestMapping("/deleteNote.do")
	public Map<String, String> deleteNote(String noteNo) throws Exception {
		service.deleteNote(Integer.parseInt(noteNo));
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "노트가 삭제되었습니다.");
		return msg;
	}
	@RequestMapping("/deleteCategory.do")
	public Map<String, String> deleteCategory(String categoryNo) throws Exception {
		service.deleteCategory(Integer.parseInt(categoryNo));
		Map<String, String> msg = new HashMap<>();
		msg.put("msg", "카테고리가 삭제되었습니다.");
		return msg;
	}
	
	@RequestMapping("/addCategory.do")
	public Map<String, Object> addCategory(HttpServletRequest request) throws Exception {
		CategoryVO category = new CategoryVO();
		category.setCategoryName(request.getParameter("categoryName"));
		category.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		
		List<CategoryVO> categoryList = service.addCategory(category);
		Map<String, Object> msg = new HashMap<>();
		msg.put("msg", "카테고리가 추가되었습니다.");
		msg.put("categoryList", categoryList);
		return msg;
	}
	@RequestMapping("/getCategory.do")
	public Map<String, Object> getCategory(HttpServletRequest request) throws Exception {
		CategoryVO category = new CategoryVO();
		category.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		
		List<CategoryVO> categoryList = service.getCategory(category);
		Map<String, Object> msg = new HashMap<>();
		msg.put("categoryList", categoryList);
		return msg;
	}
	@RequestMapping("/mailNote.do")
	public Map<String, Object> mailNote(HttpServletRequest request) throws Exception{
	    String emailTo = request.getParameter("emailTo");
	    int noteNo = Integer.parseInt(request.getParameter("noteNo"));
	    int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	   
	    NoteVO note = new NoteVO();
	    note.setNoteNo(noteNo);
	    note.setMemberNo(memberNo);
	    NoteVO noteVO = service.emailNote(note);
	    
	    String email = "scmtest@naver.com";
	    String t = noteVO.getNoteTitle();
	    String c = noteVO.getNoteContent();
	    
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
        message.setSubject("[드래그 노트] " + t);
 
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
         
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setContent(t+"<br>"+c, "text/html; charset=UTF-8");
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
}
