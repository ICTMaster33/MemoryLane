package kr.co.mlec.vo;

import java.util.Date;

public class DragVO {
	private int dragNo;
	private int memberNo;
	private String dragContent;
	private String dragUrl;
	private String dragUrlTitle;
	private Date dragRegDate;
	private Date dragUpdateDate;
	private String searchWrd;
	private String content_Data;
	
//test
	public int getDragNo() {
		return dragNo;
	}
	public void setDragNo(int dragNo) {
		this.dragNo = dragNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getDragContent() {
		return dragContent;
	}
	public void setDragContent(String dragContent) {
		this.dragContent = dragContent;
	}
	public String getDragUrl() {
		return dragUrl;
	}
	public void setDragUrl(String dragUrl) {
		this.dragUrl = dragUrl;
	}
	public String getDragUrlTitle() {
		return dragUrlTitle;
	}
	public void setDragUrlTitle(String dragUrlTitle) {
		this.dragUrlTitle = dragUrlTitle;
	}
	public Date getDragRegDate() {
		return dragRegDate;
	}
	public void setDragRegDate(Date dragRegDate) {
		this.dragRegDate = dragRegDate;
	}
	public Date getDragUpdateDate() {
		return dragUpdateDate;
	}
	public void setDragUpdateDate(Date dragUpdateDate) {
		this.dragUpdateDate = dragUpdateDate;
	}
	public String getSearchWrd() {
		return searchWrd;
	}
	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}
	public String getContent_Data() {
		return content_Data;
	}
	public void setContent_Data(String content_Data) {
		this.content_Data = content_Data;
	}
//
	@Override
	public String toString() {
		return "DragVO [dragNo=" + dragNo + ", memberNo=" + memberNo + ", dragContent=" + dragContent + ", dragUrl="
				+ dragUrl + ", dragUrlTitle=" + dragUrlTitle + ", dragRegDate=" + dragRegDate + ", dragUpdateDate="
				+ dragUpdateDate + ", searchWrd=" + searchWrd + ", content_Data=" + content_Data + "]";
	}
}
