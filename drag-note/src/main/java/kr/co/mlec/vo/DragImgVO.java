package kr.co.mlec.vo;

public class DragImgVO {
	private int dragImgNo;
	private int dragNo;
	private String dragImgPath;

	public int getDragImgNo() {
		return dragImgNo;
	}
	public void setDragImgNo(int dragImgNo) {
		this.dragImgNo = dragImgNo;
	}
	public int getDragNo() {
		return dragNo;
	}
	public void setDragNo(int dragNo) {
		this.dragNo = dragNo;
	}
	public String getDragImgPath() {
		return dragImgPath;
	}
	public void setDragImgPath(String dragImgPath) {
		this.dragImgPath = dragImgPath;
	}
	
	@Override
	public String toString() {
		return "DragImgVO [dragImgNo=" + dragImgNo + ", dragNo=" + dragNo + ", dragImgPath=" + dragImgPath + "]";
	}
}