package com.test.memory.vo;

/**
 * 쪽지를 정의하는 모델
 */
public class MemoVO {
	private int num;
	private String fromEmail;
	private String toEmail;
	private String title;
	private String content;
	private String inputdate;
	
	public MemoVO() {	}

	public MemoVO(int num, String fromEmail, String toEmail, String title, String content, String inputdate) {
		this.num = num;
		this.fromEmail = fromEmail;
		this.toEmail = toEmail;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "MemoVO [num=" + num + ", fromEmail=" + fromEmail + ", toEmail=" + toEmail + ", title=" + title + ", content="
				+ content + ", inputdate=" + inputdate + "]";
	}
}