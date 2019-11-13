package com.mvc.inssa.guestbookcomm.dto;

import java.sql.Date;

public class GuestBookCommDto {
	private int commnum;
	private int boardnum;
	private String username;
	private String nickname;
	private String guestbookcomm;
	private String reporting_date;
	private String a;
	private String b;

	public GuestBookCommDto() {
	}

	public GuestBookCommDto(int commnum, int boardnum, String username, String nickname, String guestbookcomm,
			String reporting_date, String a, String b) {
		super();
		this.commnum = commnum;
		this.boardnum = boardnum;
		this.username = username;
		this.nickname = nickname;
		this.guestbookcomm = guestbookcomm;
		this.reporting_date = reporting_date;
		this.a = a;
		this.b = b;
	}

	public int getCommnum() {
		return commnum;
	}

	public void setCommnum(int commnum) {
		this.commnum = commnum;
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

	public String getGuestbookcomm() {
		return guestbookcomm;
	}

	public void setGuestbookcomm(String guestbookcomm) {
		this.guestbookcomm = guestbookcomm;
	}

	public String getReporting_date() {
		return reporting_date;
	}

	public void setReporting_date(String reporting_date) {
		this.reporting_date = reporting_date;
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
