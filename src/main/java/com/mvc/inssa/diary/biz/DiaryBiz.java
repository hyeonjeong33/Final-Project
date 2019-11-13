package com.mvc.inssa.diary.biz;

import java.util.List;

import com.mvc.inssa.diary.dto.DiaryDto;

public interface DiaryBiz {
	
	public int add_schedule(DiaryDto dto);
	public List<DiaryDto> schedulelist(String username);
	public DiaryDto detail_content(int seq);
	public int detail_update(DiaryDto dto);
	public int delete_schedule(int scheduleno);

}
