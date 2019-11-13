package com.mvc.inssa.diary.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.diary.dto.DiaryDto;

@Repository
public class DiaryDaoImpl implements DiaryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int add_schedule(DiaryDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace+"add_schedule", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<DiaryDto> schedulelist(String username) {
		List<DiaryDto> list = new ArrayList<DiaryDto>();
		
		list = sqlSession.selectList(namespace+"schedulelist", username);
		//system.out.println("일정리스트 : "+list);
		
		return list;
	}

	@Override
	public DiaryDto detail_content(int seq) {
		DiaryDto dto = new DiaryDto();
		
		dto = sqlSession.selectOne(namespace+"detail_content", seq);
		//system.out.println("디테일일정 : "+dto);
		
		return dto;
	}

	@Override
	public int detail_update(DiaryDto dto) {
		int res = 0;
		
		res = sqlSession.update(namespace+"schedule_update", dto);
		//system.out.println("일정 수정 res : "+res);
		
		return res;
	}

	@Override
	public int delete_schedule(int scheduleno) {
		int res = 0;
		
		res = sqlSession.delete(namespace+"delete_schedule",scheduleno);
		//system.out.println("일정 삭제 res : "+res);
		
		return res;
	}

}
