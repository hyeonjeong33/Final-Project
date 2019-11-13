package com.mvc.inssa;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.inssa.GuestBook.biz.GuestBookBiz;
import com.mvc.inssa.GuestBook.dto.GuestBookDto;
import com.mvc.inssa.guestbookcomm.biz.GuestBookCommBiz;
import com.mvc.inssa.guestbookcomm.dto.GuestBookCommDto;
import com.mvc.inssa.user.biz.UserBiz;
import com.mvc.inssa.user.dto.UserDto;

@Controller
public class GuestBookController {

	@Resource(name = "sessionRegistry")
	private SessionRegistryImpl sessionRegistry;

	@Autowired
	private GuestBookBiz guestBookbiz;

	@Autowired
	private GuestBookCommBiz guestCommbiz;

	@Autowired
	private UserBiz userbiz;

	@RequestMapping("/visitor.do")
	   public String visitor(Model model, Principal principal) {
	      
		List<GuestBookDto> list = new ArrayList<GuestBookDto>();
		list = guestBookbiz.selectList(principal.getName());
		//system.out.println(list.size());
		List<UserDto> newlist = new ArrayList<UserDto>();
		
		for(int i=0 ; i<list.size() ; i++) {
			newlist.add(userbiz.user_detail(list.get(i).getUsername()));
		}
		//system.out.println(newlist);
		//system.out.println(newlist.size());
		
		model.addAttribute("guestlist", guestBookbiz.selectList(principal.getName()));
		model.addAttribute("comm", guestCommbiz.selectList());
		model.addAttribute("guestdto", newlist);
		return "visitor";
	   }

	@RequestMapping("/GuestBookInsert.do")
	@ResponseBody
	public Map<Object, Object> GuestBookInsert(String content, String secret, Principal principal, String sendTo) {
		//system.out.println("[방명록] 현재 로그인 되어있는 아이디 : " + principal.getName());
		//system.out.println("[방명록] 들어와 있는 친구 아이디 : " + sendTo);
		//system.out.println("content:" + content);
		//system.out.println("secret:" + secret);

		Map<Object, Object> map = new HashMap<Object, Object>();
		GuestBookDto dto = new GuestBookDto(0, principal.getName(), "ii", content, null, sendTo, secret, null, null);

		int res = guestBookbiz.insert(dto);
		GuestBookDto rownumone = guestBookbiz.rownumone();
		GuestBookDto rownumresult = guestBookbiz.rownumresult(rownumone.getBoardnum());
		if (res > 0) {
			//system.out.println("방명록 Insert db 성공!");
			map.put("res", res);
			map.put("rownumresult", rownumresult);
			map.put("usermini",userbiz.user_detail(principal.getName()).getUsermini());
			//system.out.println(map.get(rownumresult));
		} else {
			//system.out.println("방명록 insert db 실패!");
			map.put("res", res);
		}

		return map;
	}

	@RequestMapping("/GuestBookDelete.do")
	@ResponseBody
	public Map<String, Object> GuestBookDelete(int boardnum) {
		Map<String, Object> map = new HashMap<String, Object>();

		guestBookbiz.delete(boardnum);

		map.put("boardnum", boardnum);

		return map;
	}

	@RequestMapping("/GuestBookCommInsert.do")
	@ResponseBody
	public Map<String, Object> GuestBookCommInsert(int boardnum, String commContent, Principal principal) {

		Map<String, Object> map = new HashMap<String, Object>();
		GuestBookCommDto dto = new GuestBookCommDto(0, boardnum, principal.getName(), "닉네임", commContent, null, null,
				null);
		int res = guestCommbiz.insert(dto);

		GuestBookCommDto rownumone = guestCommbiz.rownumone();
		GuestBookCommDto rownumresult = guestCommbiz.rownumresult(rownumone.getCommnum());

		if (res > 0) {
			//system.out.println("댓글 DB 저장 성공");
			map.put("rownumresult", rownumresult);
		} else {
			//system.out.println("댓글 실패");
		}

		return map;
	}

	@RequestMapping("/GuestBookCommDelete.do")
	@ResponseBody
	public Map<String, Object> GuestBookCommdelete(int commnum) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("deletecommnum", commnum);

		guestCommbiz.delete(commnum);

		return map;
	}

	@RequestMapping("/guestUpdateForm.do")
	@ResponseBody
	public Map<String, Object> GuestUpdateForm(int boardnum) {

		Map<String, Object> map = new HashMap<String, Object>();

		GuestBookDto dto = guestBookbiz.selectOne(boardnum);

		map.put("boardnum", dto.getBoardnum());
		map.put("content", dto.getContent());
		map.put("rownumresult", dto);

		return map;
	}

	@RequestMapping("/guestUpdate.do")
	@ResponseBody
	public Map<String, Object> GuestUpdate(int boardnum, String content) {

		Map<String, Object> map = new HashMap<String, Object>();

		//system.out.println(boardnum);
		//system.out.println(content);

		GuestBookDto dto = new GuestBookDto();
		dto.setBoardnum(boardnum);
		dto.setContent(content);

		int res = guestBookbiz.update(dto);

		if (res > 0) {
			GuestBookDto Newdto = guestBookbiz.selectOne(boardnum);
			map.put("result", Newdto);
		} else {
			map.put("chk", "수정실패");
		}

		return map;
	}
}