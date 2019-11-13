package com.mvc.inssa.posts.dto;


import java.sql.Date;

public class PostsDto {
	
	private int boardnum;//게시글넘버
	private String username;//사용자이름
	private String postcomm;//게시글내용==댓글
	private String post_content;//사진경로
	private String post_thumbnail;//썸네일
	private Date postdate;//작성일
	private String hashtag;//해시태그
	
	
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

	public String getPostcomm() {
		return postcomm;
	}
	public void setPostcomm(String postcomm) {
		this.postcomm = postcomm;
	}

	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	
	public String getPost_thumbnail() {
		return post_thumbnail;
	}
	public void setPost_thumbnail(String post_thumbnail) {
		this.post_thumbnail = post_thumbnail;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	
	public PostsDto(int boardnum, String username, String postcomm, String post_content, String post_thumbnail,
			Date postdate, String hashtag) {
		super();
		this.boardnum = boardnum;
		this.username = username;
		this.postcomm = postcomm;
		this.post_content = post_content;
		this.post_thumbnail = post_thumbnail;
		this.postdate = postdate;
		this.hashtag = hashtag;
	}
	public PostsDto() {
		super();
	}
	
	
	
	
	
	
	

}
