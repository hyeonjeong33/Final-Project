package com.mvc.inssa.friend.dto;

public class FriendDto {
	 
     private String username;
	 private String friend;
	 private String allow;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}
	public String getAllow() {
		return allow;
	}
	public void setAllow(String allow) {
		this.allow = allow;
	}
	public FriendDto(String username, String friend, String allow) {
		super();
		this.username = username;
		this.friend = friend;
		this.allow = allow;
	}
	public FriendDto() {
		super();
	}
	 
	 

}
