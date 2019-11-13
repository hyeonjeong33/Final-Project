package com.mvc.inssa;

import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.inssa.diary.biz.DiaryBiz;
import com.mvc.inssa.diary.dto.DiaryDto;
import com.mvc.inssa.user.biz.UserBiz;

@Controller
public class DiaryController {
	
	@Autowired
	private UserBiz userbiz;
	
	@Autowired
	private DiaryBiz diarybiz;
	
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@RequestMapping("/add_schedule.do")
	public String add_schedule(Principal principal, HttpSession session) {
		String id = principal.getName();
		//system.out.println("현재 로그인 되어있는 아이디 : "+id);
		session.setAttribute("dto", userbiz.user_detail(id));
		return "plus_schedule";
	}
	
	@RequestMapping("/add_schedule_response.do")
	public String add_schedule_response(@ModelAttribute DiaryDto dto, Principal principal, HttpSession session) {

		String id = principal.getName();
		//system.out.println("다이어리에서 현재 로그인 되어있는 아이디 : "+id);
		session.setAttribute("dto", userbiz.user_detail(id));
		
		dto.setUsername(id);
		
		//system.out.println("세팅 후 username : "+dto.getUsername());
		//system.out.println("title : "+dto.getTitle());
		//system.out.println("start_date : "+dto.getStart_date());
		//system.out.println("end_date : "+dto.getEnd_date());
		
		int res = 0;
		res = diarybiz.add_schedule(dto);
		//system.out.println("add_schedule의 res : "+res);
		
		return "diary";
	}
	
	@RequestMapping("/jason_diary.do")
	@ResponseBody
	public JSONObject jason_diary(Principal principal) {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		List<DiaryDto> list = new ArrayList<DiaryDto>();
		list = diarybiz.schedulelist(principal.getName());
		
		for(int i=0 ; i<list.size() ; i++) {
			JSONObject obj = new JSONObject();
			obj.put("title", list.get(i).getTitle());
			DateFormat sdFormat = new SimpleDateFormat("YYYY-MM-dd");
			
			String start = sdFormat.format(list.get(i).getStart_date())+"T"+list.get(i).getStart_time();
			String end = sdFormat.format(list.get(i).getEnd_date())+"T"+list.get(i).getEnd_time();
			int seq = list.get(i).getScheduleno();
			//system.out.println("start : "+start+" | end : "+end+" | seq :"+seq);
			
			obj.put("start", start);
			obj.put("end", end);
			obj.put("seq", seq);
			//system.out.println("작은json : "+obj);
			jsonArr.add(obj);
		}
		//system.out.println("json배열 : "+jsonArr);
		jsonObj.put("list", jsonArr);
		//system.out.println("큰json : "+jsonObj);
		
		return jsonObj;
	}
	
	@RequestMapping("/detail_schedule.do")
	public String detail_schedule(int seq, HttpSession session) {
		//system.out.println("선택된 일정 seq : "+seq);
		session.setAttribute("detail", diarybiz.detail_content(seq));
		//system.out.println("detail서 session 담겼나 확인 : "+session);
		return "detail_schedule";
	}
	
	@RequestMapping("/detail_update.do")
	public String detail_update(int scheduleno, HttpSession session) {
		session.setAttribute("detail", diarybiz.detail_content(scheduleno));
		return "detail_update";
	}
	
	@RequestMapping("/detail_update_form.do")
	@ResponseBody
	public String detail_update_form(@ModelAttribute DiaryDto dto, Principal principal) {
		int res = 0;

		dto.setUsername(principal.getName());
		//system.out.println("일정 수정 dto : "+dto);
		
		res = diarybiz.detail_update(dto);
		if(res>0) {
			//system.out.println("일정 수정 성공!");
		}else {
			//system.out.println("일정 수정 실패ㅜ");
		}
		return "diary";
	}
	
	@RequestMapping("/delete_schedule.do")
	@ResponseBody
	public String delete_schedule(int scheduleno) {
		int res = 0;
		//system.out.println("삭제할 일정 seq : "+scheduleno);
		
		res = diarybiz.delete_schedule(scheduleno);
		if(res>0) {
			//system.out.println("일정 삭제 서엉고옹!");
		}else {
			//system.out.println("일정 삭제 실패애");
		}
		return "redirect:diary.do";
	}

}
