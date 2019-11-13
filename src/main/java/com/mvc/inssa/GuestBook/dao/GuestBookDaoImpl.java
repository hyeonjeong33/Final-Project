package com.mvc.inssa.GuestBook.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.GuestBook.dto.GuestBookDto;


@Repository
public class GuestBookDaoImpl implements GuestBookDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<GuestBookDto> selectList(String sendto) {
		
		List<GuestBookDto> list = new ArrayList<GuestBookDto>();
		//system.out.println("방명록 주인 : "+sendto);
		try {
			list = sqlSession.selectList(namespace+"selectList",sendto);
		} catch (Exception e) {
			//system.out.println("guestBook selectlist error");
			e.printStackTrace();
		}
				
		
		return list;
	}
	
	@Override
	public List<GuestBookDto> selectList_friend(String sendto, String username) {
		
		List<GuestBookDto> list = new ArrayList<GuestBookDto>();
		//system.out.println("방명록 주인 : "+sendto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sendto", sendto);
		map.put("myname", username);
		
		try {
			list = sqlSession.selectList(namespace+"selectList_friend",map);
		} catch (Exception e) {
			//system.out.println("guestBook selectlist error");
			e.printStackTrace();
		}
				
		
		return list;
	}

	@Override
	public int insert(GuestBookDto dto) {
		
		int res = 0;
		
		res = sqlSession.insert(namespace+"guestBookInsert",dto);
		
		return res;
	}

	@Override
	public int update(GuestBookDto dto) {
		 int res = 0;
	      
	      res = sqlSession.update(namespace+"guestBookUpdate",dto);
	      
	      return res;
	}

	@Override
	public int delete(int boardnum) {

		int res = 0;
		
		try {
			res = sqlSession.delete(namespace+"guestBookDelete",boardnum);
		} catch (Exception e) {
			//system.out.println("delete Error");
			e.printStackTrace();
		}
		 
		return res;
	}

	@Override
	public GuestBookDto rownumone() {
		
		GuestBookDto dto = sqlSession.selectOne(namespace+"rownumone");
		
		return dto;
	}

	@Override
	public GuestBookDto rownumresult(int rownumone) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("boardnum", rownumone);
		GuestBookDto dto = sqlSession.selectOne(namespace+"babo", map);
		 
		return dto;
	}

	@Override
	public GuestBookDto selectOne(int boardnum) {
		
		GuestBookDto dto = sqlSession.selectOne(namespace+"selectOne", boardnum);
		
		return dto;
	} 

}
