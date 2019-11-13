package com.mvc.inssa.GuestBook.dto;

import java.sql.Date;



public class GuestBookDto {

	private int boardnum;
	private String username;
	private String nickname;
	private String content;
	private String reporting_date;
	private String sendTo;
	private String secret;
	private String a;
	private String b;
	
	public GuestBookDto() {
	}

	public GuestBookDto(int boardnum, String username, String nickname, String content, String reporting_date,
			String sendTo, String secret, String a, String b) {
		super();
		this.boardnum = boardnum;
		this.username = username;
		this.nickname = nickname;
		this.content = content;
		this.reporting_date = reporting_date;
		this.sendTo = sendTo;
		this.secret = secret;
		this.a = a;
		this.b = b;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReporting_date() {
		return reporting_date;
	}

	public void setReporting_date(String reporting_date) {
		this.reporting_date = reporting_date;
	}

	public String getSendTo() {
		return sendTo;
	}

	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}
	
	
	
}
