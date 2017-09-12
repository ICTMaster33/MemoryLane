package com.test.memory.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.memory.service.DragService;
import com.test.memory.service.NoteService;
import com.test.memory.vo.DragVO;
import com.test.memory.vo.NoteVO;

@RestController
@RequestMapping("/download")
public class DownloadController {
	
	private FileInputStream fis;	//파일을 읽기위한
	private ObjectInputStream ois;	//객체를 읽기위한
	private String FILE_PATH = "C:/data/";
//	private String FILE_PATH = "G:/SPRING/git/MemoryLane/drag-note/src/main/webapp/html/data/";
	private String IMG_FILE_PATH = FILE_PATH+"img/"; //이미지파일 저장경로
	private String FILE_PATH_WEB = "http://localhost:8888/memory/img_src/"; //이미지파일 태그경로
	private String SAVE_PATH = "C:/savedata/";
	
	@Autowired
	private NoteService service_n;
	private DragService service_d;
	
	@RequestMapping("/downloadNote")
	public Map<String, String> downloadNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		// 파일 내용 가져오기
		int noteNo = Integer.parseInt(request.getParameter("noteNo"));
		System.out.println("다운로드 : " + noteNo);
		NoteVO noteVO = service_n.noteDetail(noteNo);
		// 노트 작성한 날짜로 파일 경로 만들기 
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(noteVO.getNoteRegDate());
		String savePath = SAVE_PATH + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		// 파일 내용 정하기
		String noteContent = noteVO.getNoteContent();
		String noteTitle = noteVO.getNoteTitle();
		SimpleDateFormat s = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String noteRegDate = s.format(noteVO.getNoteRegDate());
		try{
			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
			fis = new FileInputStream(FILE_PATH + noteContent);
			
			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
			ois = new ObjectInputStream(fis);
			
			// 오브젝트 스트림으로부터 오브젝트를 읽어 String형으로 형변환
			noteContent = (String) ois.readObject();
			} catch(Exception e) {
				// e.printStackTrace();
				System.out.println("[에러] 파일 읽기에 실패하였습니다.");
			} finally {
				closeStreams();
		}
		String txt = "<!DOCTYPE html>"
				   + "<html>"
				   + "<meta charset='UTF-8'>"
				   + "<title>" + noteTitle + "</title>"
				   + "<link rel='stylesheet' href='https://www.w3schools.com/w3css/4/w3.css'>"
				   + "<style> img {max-width: 100%;} </style>"
				   + "<body>"
				   + "<div class='w3-display-middle w3-card w3-padding' style='min-height:60%;width:800px; padding: 100px 100px 100px 100px;'>"
				   + "<div class='w3-margin w3-padding' style='text-align:center;'>"
				   + "<h3>" + noteTitle +"</h3>"
				   + "</div>"
				   + "<div class='w3-margin w3-padding' style='text-align:right;color:grey;'>"
				   + noteRegDate
				   + "</div>"
				   + "<div class='w3-margin w3-padding' style='text-align:center; id='content' >"
				   + noteContent
				   + "</div>"
				   + "</body>"
				   + "</html>";
		String fileName = noteTitle + ".html";
		String filePath = savePath + "/"+ fileName;
		File confirmF = new File(filePath);
		if(confirmF.exists()) confirmF.delete();
		
		File file = null;
	    BufferedInputStream fin = null;
	    BufferedOutputStream outs = null;
		try{
	                         
            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath), "utf-8"));
             
            // 파일안에 문자열 쓰기
            fw.write(txt);
            fw.flush();
 
            // 객체 닫기
            fw.close();
            
            // 파일 다운로드 보내기
            file = new File(savePath, fileName);
            System.out.println(fileName);
            String fileDownName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	        response.reset();
	    	response.setCharacterEncoding("UTF-8");
	        response.setHeader("Content-Type","text/html;charset=UTF-8");
	        response.setHeader("Content-Disposition","attachment;filename='"+fileDownName+"'");
	 
	        if(file != null){
	            fin = new BufferedInputStream(new FileInputStream(file));
	            outs = new BufferedOutputStream(response.getOutputStream());
	 
	            int read = 0;
	 
	            while((read = fin.read()) != -1 ){
	                outs.write(read);
	            }
	        }
             
        }catch(Exception e){
            e.printStackTrace();
        }finally{
       	 
	        if(outs != null) fin.close();
	        if(fin != null) outs.close();
	 
	    }
		outs.flush();
		
        // 성공 메시지 보내기
	    Map<String, String> msg = new HashMap<>();
		msg.put("filePath", filePath);
		return msg;
	}
	
	@RequestMapping("/downloadDrag")
	public Map<String, String> dragloadNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		// 파일 내용 가져오기
		int dragNo = Integer.parseInt(request.getParameter("dragNo"));
		System.out.println("다운로드 : " + dragNo);
		DragVO dragVO = service_d.dragDetail(dragNo);
		// 노트 작성한 날짜로 파일 경로 만들기 
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(dragVO.getDragRegDate());
		String savePath = SAVE_PATH + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		// 파일 내용 정하기
		String dragContent = dragVO.getDragContent();
		String dragTitle = dragVO.getDragUrlTitle();
		SimpleDateFormat s = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String dragRegDate = s.format(dragVO.getDragRegDate());
		try{
			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
			fis = new FileInputStream(FILE_PATH + dragContent);
			
			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
			ois = new ObjectInputStream(fis);
			
			// 오브젝트 스트림으로부터 오브젝트를 읽어 String형으로 형변환
			dragContent = (String) ois.readObject();
			} catch(Exception e) {
				// e.printStackTrace();
				System.out.println("[에러] 파일 읽기에 실패하였습니다.");
			} finally {
				closeStreams();
		}
		String txt = "<!DOCTYPE html>"
				   + "<html>"
				   + "<meta charset='UTF-8'>"
				   + "<title>" + dragTitle + "</title>"
				   + "<link rel='stylesheet' href='https://www.w3schools.com/w3css/4/w3.css'>"
				   + "<style> img {max-width: 100%;} </style>"
				   + "<body>"
				   + "<div class='w3-display-middle w3-card w3-padding' style='min-height:60%;width:800px; padding: 100px 100px 100px 100px;'>"
				   + "<div class='w3-margin w3-padding' style='text-align:center;'>"
				   + "<h3>" + dragTitle +"</h3>"
				   + "</div>"
				   + "<div class='w3-margin w3-padding' style='text-align:right;color:grey;'>"
				   + dragRegDate
				   + "</div>"
				   + "<div class='w3-margin w3-padding' style='text-align:center; id='content' >"
				   + dragContent
				   + "</div>"
				   + "</body>"
				   + "</html>";
		String fileName = dragTitle + ".html";
		String filePath = savePath + "/"+ fileName;
		File confirmF = new File(filePath);
		if(confirmF.exists()) confirmF.delete();
		
		File file = null;
	    BufferedInputStream fin = null;
	    BufferedOutputStream outs = null;
		try{
	                         
            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath), "utf-8"));
             
            // 파일안에 문자열 쓰기
            fw.write(txt);
            fw.flush();
 
            // 객체 닫기
            fw.close();
            
            // 파일 다운로드 보내기
            file = new File(savePath, fileName);
            System.out.println(fileName);
            String fileDownName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	        response.reset();
	    	response.setCharacterEncoding("UTF-8");
	        response.setHeader("Content-Type","text/html;charset=UTF-8");
	        response.setHeader("Content-Disposition","attachment;filename='"+fileDownName+"'");
	 
	        if(file != null){
	            fin = new BufferedInputStream(new FileInputStream(file));
	            outs = new BufferedOutputStream(response.getOutputStream());
	 
	            int read = 0;
	 
	            while((read = fin.read()) != -1 ){
	                outs.write(read);
	            }
	        }
             
        }catch(Exception e){
            e.printStackTrace();
        }finally{
       	 
	        if(outs != null) fin.close();
	        if(fin != null) outs.close();
	 
	    }
		outs.flush();
		
        // 성공 메시지 보내기
	    Map<String, String> msg = new HashMap<>();
		msg.put("filePath", filePath);
		return msg;
	}
	
	//파일 관련 스트림 close
	private void closeStreams() {
		try {
			if(fis != null) fis.close();
			if(ois != null) ois.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
