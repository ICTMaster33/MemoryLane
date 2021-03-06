package kr.co.mlec.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mlec.service.NoteService;
import kr.co.mlec.vo.NoteVO;

@RestController
@RequestMapping("/download")
public class DownloadController {
	
	@Autowired
	private NoteService service;
	
	
	@RequestMapping("/downloadNote.do")
	public Map<String, String> downloadNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		// 파일 내용 가져오기
		int noteNo = Integer.parseInt(request.getParameter("noteNo"));
		System.out.println("다운로드 : " + noteNo);
		NoteVO noteVO = service.noteDetail(noteNo);
		// 노트 작성한 날짜로 파일 경로 만들기 
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(noteVO.getNoteRegDate());
		String savePath = "C:/noteDownload" + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		// 파일 내용 정하기
		String noteContent = noteVO.getNoteContent();
		String noteTitle = noteVO.getNoteTitle();
		SimpleDateFormat s = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String noteRegDate = s.format(noteVO.getNoteRegDate());
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
		
        // 성공 메시지 보내기~
	    Map<String, String> msg = new HashMap<>();
		msg.put("filePath", filePath);
		return msg;
	}

}
