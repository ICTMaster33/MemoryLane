package com.test.memory.vo;

public class MemberVO {
	private int mem_no;
	private String name;
	private String email;
	private String password;
	private int approvalNum;
	
	public int getMemberNo() {
		return mem_no;
	}
	public void setMemberNo(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(int approvalNum) {
		this.approvalNum = approvalNum;
	}
	
}
