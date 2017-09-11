package com.test.memory.vo;

public class FriendVO {
	private String myEmail;
	private String friend_Email;
	private String name;
	public FriendVO() {}
	public FriendVO(String myEmail, String friend_Email, String name) {
		super();
		this.myEmail = myEmail;
		this.friend_Email = friend_Email;
		this.name = name;
	}
	public String getMyEmail() {
		return myEmail;
	}
	public void setMyEmail(String myEmail) {
		this.myEmail = myEmail;
	}
	public String getFriend_Email() {
		return friend_Email;
	}
	public void setFriend_Email(String friend_Email) {
		this.friend_Email = friend_Email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "FriendVO [myEmail=" + myEmail + ", friend_Email=" + friend_Email + ", name=" + name + "]";
	}
	
}
