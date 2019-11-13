package com.mvc.inssa.GuestBook.dao;

import java.util.List;

import com.mvc.inssa.GuestBook.dto.GuestBookDto;
 

public interface GuestBookDao {

	String namespace = "insa.";

	public List<GuestBookDto> selectList(String username );
	public List<GuestBookDto> selectList_friend(String sendto, String username);
	public int insert(GuestBookDto dto);
	public int update(GuestBookDto dto);
	public int delete(int boardnum);
	public GuestBookDto rownumone();
	public GuestBookDto rownumresult(int rownumone);
	public GuestBookDto selectOne(int boardnum);
}
