package com.test.memory.vo;

public class CategoryVO {
	private int categoryNo;
	private String categoryName;
	private int memberNo;
	
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", memberNo=" + memberNo
				+ "]";
	}
}
