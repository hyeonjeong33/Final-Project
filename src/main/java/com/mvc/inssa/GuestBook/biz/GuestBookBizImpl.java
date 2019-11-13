package com.mvc.inssa.GuestBook.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.inssa.GuestBook.dao.GuestBookDao;
import com.mvc.inssa.GuestBook.dto.GuestBookDto;

@Service
public class GuestBookBizImpl implements GuestBookBiz {

	@Autowired
	private GuestBookDao dao;
	
	@Override
	public List<GuestBookDto> selectList(String username) {
		return dao.selectList(username);
	}

	@Override
	public List<GuestBookDto> selectList_friend(String sendto, String username) {
		return dao.selectList_friend(sendto, username);
	}

	
	@Override
	public int insert(GuestBookDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(GuestBookDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int boardnum) {
		return dao.delete(boardnum);
	}

	@Override
	public GuestBookDto rownumone() {
		return dao.rownumone();
	}

	@Override
	public GuestBookDto rownumresult(int rownumone) {
		return dao.rownumresult(rownumone);
	} 

	@Override
	public GuestBookDto selectOne(int boardnum) {
		return dao.selectOne(boardnum);
	}
 
}
