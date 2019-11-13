package com.mvc.inssa.diary.dao;

import java.util.List;

import com.mvc.inssa.diary.dto.DiaryDto;

public interface DiaryDao {
	
final String namespace = "diary.";
	
	public int add_schedule(DiaryDto dto);
	public List<DiaryDto> schedulelist(String username);
	public DiaryDto detail_content(int seq);
	public int detail_update(DiaryDto dto);
	public int delete_schedule(int scheduleno);

}
