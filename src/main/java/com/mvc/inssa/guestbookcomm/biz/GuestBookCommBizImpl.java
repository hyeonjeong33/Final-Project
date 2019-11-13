package com.mvc.inssa.guestbookcomm.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.inssa.guestbookcomm.dao.GuestBookCommDao;
import com.mvc.inssa.guestbookcomm.dto.GuestBookCommDto;

@Service
public class GuestBookCommBizImpl implements GuestBookCommBiz{

	@Autowired
	private GuestBookCommDao dao;
	
	@Override
	public List<GuestBookCommDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int insert(GuestBookCommDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(GuestBookCommDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int commnum) {
		return dao.delete(commnum);
	}

	@Override
	public GuestBookCommDto rownumone() {
		return dao.rownumone();
	}

	@Override
	public GuestBookCommDto rownumresult(int rownumone) {
		return dao.rownumresult(rownumone);
	}

}
