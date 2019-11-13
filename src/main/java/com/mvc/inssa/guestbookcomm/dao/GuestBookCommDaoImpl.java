package com.mvc.inssa.guestbookcomm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.guestbookcomm.dto.GuestBookCommDto;

@Repository
public class GuestBookCommDaoImpl implements GuestBookCommDao {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<GuestBookCommDto> selectList() {
		
		List<GuestBookCommDto> list = new ArrayList<GuestBookCommDto>();
		
		try {
			list = sqlSession.selectList(namespace+"selectList");
		} catch (Exception e) {
			//system.out.println("GuestBookCommDaoImpl error");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insert(GuestBookCommDto dto) {

		int res = 0;
		
		res = sqlSession.insert(namespace+"insert",dto);
		
		return res;
	}

	@Override
	public int update(GuestBookCommDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int commnum) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(namespace+"delete",commnum);
		} catch (Exception e) {
			//system.out.println("Comm delete Error");
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public GuestBookCommDto rownumone() {
		
		GuestBookCommDto dto = sqlSession.selectOne(namespace+"rownumone");
		
		return dto;
	}

	@Override
	public GuestBookCommDto rownumresult(int rownumone) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("commnum", rownumone);
		GuestBookCommDto dto = sqlSession.selectOne(namespace+"babo", map);
		
		return dto; 
	}

}
