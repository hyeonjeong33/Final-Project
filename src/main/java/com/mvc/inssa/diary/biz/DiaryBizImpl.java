package com.mvc.inssa.diary.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mvc.inssa.diary.dao.DiaryDao;
import com.mvc.inssa.diary.dto.DiaryDto;

@Service
public class DiaryBizImpl implements DiaryBiz {

	@Autowired
	@Qualifier("diaryDaoImpl")
	private DiaryDao dao;

	@Override
	public int add_schedule(DiaryDto dto) {
		return dao.add_schedule(dto);
	}

	@Override
	public List<DiaryDto> schedulelist(String username) {
		return dao.schedulelist(username);
	}

	@Override
	public DiaryDto detail_content(int seq) {
		return dao.detail_content(seq);
	}

	@Override
	public int detail_update(DiaryDto dto) {
		return dao.detail_update(dto);
	}

	@Override
	public int delete_schedule(int scheduleno) {
		return dao.delete_schedule(scheduleno);
	}

}
