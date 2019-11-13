package com.mvc.inssa.diary.dto;

import java.sql.Date;

public class DiaryDto {
	
	private int scheduleno;
	private String username;
	private String title;
	private Date start_date;
	private Date end_date;
	private String start_time;
	private String end_time;
	
	public DiaryDto() {
		
	}

	public DiaryDto(int scheduleno, String username, String title, Date start_date, Date end_date, String start_time, String end_time) {
		this.scheduleno = scheduleno;
		this.username = username;
		this.title = title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.start_time = start_time;
		this.end_time = end_time;
	}

	public int getScheduleno() {
		return scheduleno;
	}

	public void setScheduleno(int scheduleno) {
		this.scheduleno = scheduleno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

}
