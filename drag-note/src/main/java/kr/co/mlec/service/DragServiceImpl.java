package kr.co.mlec.service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.dao.DragDao;
import kr.co.mlec.vo.DragVO;

@Service
public class DragServiceImpl implements DragService{

//	private FileInputStream fis;	//파일을 읽기위한
//	private FileOutputStream fos;	//파일을 쓰기위한
//	private ObjectInputStream ois;	//객체를 읽기위한
//	private ObjectOutputStream oos;	//객체를 쓰기위한
	
	@Autowired
	private DragDao dao;

	@Override
	public void registDrag(DragVO drag) throws Exception {
		dao.insertDrag(drag);
	}

	@Override
	public List<DragVO> dragList(DragVO drag) throws Exception {
		return dao.dragList(drag);
	}

	@Override
	public void deleteNote(int dragNo) throws Exception {
		dao.deleteDrag(dragNo);
	}

	@Override
	public DragVO selectDrag(int dragNo) throws Exception {
		return dao.selectDrag(dragNo);
	}
	
//	public void getContent(DragVO drag) {
//		try{
//			// 파일 스트림으로부터 파일명에 해당하는 파일을 읽어들인다
//			fis = new FileInputStream("c:/test/"+drag.getContent_Data());
//			
//			// 파일 스트림으로부터 오브젝트 스트림 형태로 변경
//			ois = new ObjectInputStream(fis);
//			
//			// 오브젝트 스트림으로부터 오브젝트를 읽어 ArrayList<Human>으로 형변환
//			ois.readObject();
//		} catch(Exception e) {
//			// e.printStackTrace();
//			System.out.println("[에러] 파일 읽기에 실패하였습니다.");
//		} finally {
//			closeStreams();
//		}
//	}
//	
//	private void closeStreams() {
//		try {
//			if(fis != null) fis.close();
//			if(fos != null) fos.close();
//			if(ois != null) ois.close();
//			if(oos != null) oos.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
}
