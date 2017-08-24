package kr.co.mlec.vo;

import java.util.Date;

public class NoteVO {
	private int noteNo;
	private int memberNo;
	private int categoryNo;
	private String email;
	private String noteContent;
	private String noteTitle;
	private String categoryName;
	private String searchWrd;
	private Date noteRegDate;
	private Date noteUpdateDate;
	
	
	public String getSearchWrd() {
		return searchWrd;
	}
	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getNoteNo() {
		return noteNo;
	}
	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public Date getNoteRegDate() {
		return noteRegDate;
	}
	public void setNoteRegDate(Date noteRegDate) {
		this.noteRegDate = noteRegDate;
	}
	public Date getNoteUpdateDate() {
		return noteUpdateDate;
	}
	public void setNoteUpdateDate(Date noteUpdateDate) {
		this.noteUpdateDate = noteUpdateDate;
	}

	@Override
	public String toString() {
		return "NoteVO [noteNo=" + noteNo + ", memberNo=" + memberNo + ", categoryNo=" + categoryNo + ", email=" + email
				+ ", noteContent=" + noteContent + ", noteTitle=" + noteTitle + ", categoryName=" + categoryName
				+ ", searchWrd=" + searchWrd + ", noteRegDate=" + noteRegDate + ", noteUpdateDate=" + noteUpdateDate
				+ "]";
	}
}
