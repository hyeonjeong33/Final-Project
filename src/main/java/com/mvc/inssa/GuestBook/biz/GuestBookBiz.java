package com.mvc.inssa.GuestBook.biz;

import java.util.List;

import com.mvc.inssa.GuestBook.dto.GuestBookDto;

public interface GuestBookBiz {

	public List<GuestBookDto> selectList(String username);
	public List<GuestBookDto> selectList_friend(String sendto, String username);
	public int insert(GuestBookDto dto);
	public int update(GuestBookDto dto);
	public GuestBookDto selectOne(int boardnum);
	public int delete(int boardnum);
	public GuestBookDto rownumone();
	public GuestBookDto rownumresult(int rownumone);

}
