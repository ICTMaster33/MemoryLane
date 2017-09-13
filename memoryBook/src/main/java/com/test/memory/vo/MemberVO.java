package com.test.memory.vo;

public class MemberVO {
	private int mem_no;
	private String name;
	private String email;
	private String mem_pwd;
	private int approvalNum;
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
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
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public int getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(int approvalNum) {
		this.approvalNum = approvalNum;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_no=" + mem_no + ", name=" + name + ", email=" + email + ", mem_pwd=" + mem_pwd
				+ ", approvalNum=" + approvalNum + "]";
	}
	
}
