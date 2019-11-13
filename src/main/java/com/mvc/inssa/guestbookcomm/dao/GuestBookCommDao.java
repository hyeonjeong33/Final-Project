package com.mvc.inssa.guestbookcomm.dao;

import java.util.List;

import com.mvc.inssa.guestbookcomm.dto.GuestBookCommDto;

public interface GuestBookCommDao {

	String namespace = "guestBookComm.";
	public List<GuestBookCommDto> selectList();
	public int insert(GuestBookCommDto dto);
	public int update(GuestBookCommDto dto);
	public int delete(int commnum);
	public GuestBookCommDto rownumone();
	public GuestBookCommDto rownumresult(int rownumone);
}
