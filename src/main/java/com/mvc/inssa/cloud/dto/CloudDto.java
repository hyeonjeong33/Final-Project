package com.mvc.inssa.cloud.dto;


import java.sql.Date;

public class CloudDto {
   
   private int seq;
   private int cloudnum;
   private String username;
   private String cloudcomm;
   private String content;
   private String contentname;
   private Date clouddate;
   private String cloudfolder;
   
   public CloudDto() {
	   
   }

	public CloudDto(int seq, int cloudnum, String username, String cloudcomm, String content, String contentname,
			Date clouddate, String cloudfolder) {
		super();
		this.seq = seq;
		this.cloudnum = cloudnum;
		this.username = username;
		this.cloudcomm = cloudcomm;
		this.content = content;
		this.contentname = contentname;
		this.clouddate = clouddate;
		this.cloudfolder = cloudfolder;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getCloudnum() {
		return cloudnum;
	}

	public void setCloudnum(int cloudnum) {
		this.cloudnum = cloudnum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCloudcomm() {
		return cloudcomm;
	}

	public void setCloudcomm(String cloudcomm) {
		this.cloudcomm = cloudcomm;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentname() {
		return contentname;
	}

	public void setContentname(String contentname) {
		this.contentname = contentname;
	}

	public Date getClouddate() {
		return clouddate;
	}

	public void setClouddate(Date clouddate) {
		this.clouddate = clouddate;
	}

	public String getCloudfolder() {
		return cloudfolder;
	}

	public void setCloudfolder(String cloudfolder) {
		this.cloudfolder = cloudfolder;
	}

}