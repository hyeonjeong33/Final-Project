package com.mvc.inssa;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.inssa.GuestBook.biz.GuestBookBiz;
import com.mvc.inssa.guestbookcomm.biz.GuestBookCommBiz;
import com.mvc.inssa.guestbookcomm.dto.GuestBookCommDto;
import com.mvc.inssa.posts.biz.PostsBiz;
import com.mvc.inssa.posts.dto.PostsDto;
import com.mvc.inssa.postscomm.biz.PostsCommBiz;
import com.mvc.inssa.postscomm.dto.PostsCommDto;
import com.mvc.inssa.user.biz.UserBiz;
import com.mvc.inssa.user.dto.UserDto;

@Controller
public class PostsController {
	@Resource(name = "sessionRegistry")
	private SessionRegistryImpl sessionRegistry;

	@Autowired
	private PostsBiz biz;

	@Autowired
	private PostsCommBiz postsCommbiz;
	
	@Autowired
	private UserBiz userbiz;

	private static final Logger logger = LoggerFactory.getLogger(PostsController.class);

	@RequestMapping("/posts.do")
	public String selectList(Model model, Principal principal) {

		logger.info("<<<list>>>");

		//system.out.println("친구게시판 : "+principal.getName());
		model.addAttribute("list", biz.selectList(principal.getName()));
		model.addAttribute("comm", postsCommbiz.selectList());

		return "posts";
	}

	@RequestMapping("/writeform.do")
	public String writeform() {

		return "writeform";
	}

	@RequestMapping("/post_detail.do")
	   public String detailform(Model model, @ModelAttribute PostsDto dto, int boardnum, Principal principal) {
	      logger.info("<<<detail>>>");
	      model.addAttribute("dto", biz.selectOne(boardnum));
	      model.addAttribute("comm", postsCommbiz.selectList());
	      
	      List<PostsCommDto> list = new ArrayList<PostsCommDto>();
	      List<UserDto> newlist = new ArrayList<UserDto>();
	      list = postsCommbiz.selectList();
	      for(int i=0 ; i<list.size() ; i++) {
	         newlist.add(userbiz.user_detail(list.get(i).getUsername()));
	      }
	      //system.out.println(newlist);
	      model.addAttribute("myusermini", userbiz.user_detail(biz.selectOne(boardnum).getUsername()));
	      //system.out.println("해당게시물의 작성자 유저미니 : "+userbiz.user_detail(biz.selectOne(boardnum).getUsername()));
	      model.addAttribute("commdto", newlist);

	      return "post_detail";
	   }
	
	@RequestMapping("/select_post_detail.do")
	public String select_post_detail(Model model, @ModelAttribute PostsDto dto, HttpSession session, Principal principal, int boardnum) {
		logger.info("<<<detail>>>");
		session.setAttribute("dto", userbiz.user_detail(principal.getName()));
		session.setAttribute("posts", biz.selectOne(boardnum));
		session.setAttribute("comm", postsCommbiz.selectList());

		return "select_post_detail";
	}

	@RequestMapping(value = "/postswrite.do")
	public String postswrite(Model model, @ModelAttribute PostsDto dto) {
		//system.out.println("썸머노트당");
		logger.info("<admin_conlistwriteform.do>");

		//system.out.println(dto.getPostcomm());
		//system.out.println(dto.getPost_content());
		String[] strarr = dto.getPost_content().split("<p><img ");

		//system.out.println("길이가요 ->" + strarr.length);

		for (int i = 0; i < strarr.length; i++) {
			//system.out.println("strarr[i] : " + strarr[i]);
		}

		if (strarr.length == 1) {
			dto.setPost_thumbnail("<img " + strarr[0] + ">");
			//system.out.println(dto.getPost_thumbnail());
		} else {
			String[] arr = strarr[1].split("style|>");
			dto.setPost_thumbnail("<img " + arr[0] + ">");
		}

		//system.out.println("content : " + dto.getPost_thumbnail());

//	      for(int i=0;i<strarr.length;i++) {
//	    	  System.out.printf("starr[i] : " + strarr[i]);
//	    	  //system.out.println(" ");
//	    	  //system.out.println(dto.getContent());
//	      
//	    	  if(strarr.length<2) {
//	    		  dto.setContent(strarr[i]);
//		      }else {
//		    	 String [] arr = strarr[i].split("style|>");
//		         dto.setContent("<img "+arr[i]+">");     
//		         //system.out.println("arr[i] : " + arr[i]);
//		      }
//	      }

		//system.out.println("------------------------------");
		//system.out.println("username : " + dto.getUsername());
		//system.out.println("postcomm : " + dto.getPostcomm());
		//system.out.println("content : " + dto.getPost_content());
		//system.out.println("thumbnail : " + dto.getPost_thumbnail());
		//system.out.println();

		int res = biz.insert(dto);

		//system.out.println("나는 인서트야" + res);

		if (res > 0) {
			//system.out.println("저장 완료");
			return "redirect:posts.do";
		} else {
			//system.out.println("저장 실패");
			return "redirect:posts.do";
		}
	}

	/*
	 * @RequestMapping("/hashtag_list.do") public String hashtag_list(Model model,
	 * String hashtag, @ModelAttribute PostsDto dto) {
	 * 
	 * logger.info("<<<list>>>");
	 * 
	 * //system.out.println("hashtag : " +hashtag); model.addAttribute("list",
	 * biz.hashtagList(hashtag)); model.addAttribute("hash", hashtag);
	 * 
	 * return "hashtag_list"; }
	 */

//============== 댓글 작성===============	

	@RequestMapping("/PostsCommInsert.do")
	@ResponseBody
	public Map<String, Object> PostsCommInsert(int boardnum, String commContent, Principal principal) {

		Map<String, Object> map = new HashMap<String, Object>();
		PostsCommDto dto = new PostsCommDto(0, boardnum, principal.getName(), commContent, null, 0, 0, 0);
		int res = postsCommbiz.insert(dto);

		PostsCommDto rownumone = postsCommbiz.rownumone();
		PostsCommDto rownumresult = postsCommbiz.rownumresult(rownumone.getCommnum());
		UserDto userdto = userbiz.select_mini(principal.getName());
		
		if (res > 0) {
			//system.out.println("댓글 DB 저장 성공");
			map.put("rownumresult", rownumresult);
			map.put("mini",userdto.getUsermini());
		} else {
			//system.out.println("댓글 실패");
		}

		return map;
	}

	@RequestMapping("/add_comm.do")
	@ResponseBody
	public Map<String, Object> add_comm(int boardnum, int commnum, String content, Principal principal) {

		Map<String, Object> map = new HashMap<String, Object>();
		PostsCommDto dto = new PostsCommDto(commnum, boardnum, principal.getName(), content, null, 0, 0, 0);

		int res = postsCommbiz.add_comm(dto);

		if (res > 0) {
			//system.out.println("대댓글 DB 저장 성공 ");
			map.put("content", content);
			map.put("username", principal.getName());
		} else {
			//system.out.println("대댓글 저장 실패");
		}

		return map;
	}

	@RequestMapping("/PostsCommDelete.do")
	@ResponseBody
	public Map<String, Object> PostsCommdelete(int commnum) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("deletecommnum", commnum);

		postsCommbiz.delete(commnum);

		return map;
	}

	@RequestMapping("/deletePost.do")
	@ResponseBody
	public Map<String, Object> deletePost(int boardnum) {
		Map<String, Object> map = new HashMap<String, Object>();

		int res = biz.delete(boardnum);

		if (res > 0) {
			map.put("result", "삭제성공");
		} else {
			map.put("result", "삭제실패");
		}

		return map;
	}

	@RequestMapping("/more_pop.do")
	public String more_pop() {

		return "more_pop";
	}

	@RequestMapping("/searchlist.do")
	public String searchlist(Model model, String keyword) {

		logger.info("<<<search>>>");

		model.addAttribute("list", biz.searchlist(keyword));
		//system.out.println("list 실행");
		model.addAttribute("list1", biz.searchlist1(keyword));
		//system.out.println("list1 실행");
		model.addAttribute("list2", biz.searchlist2(keyword));
		//system.out.println("list2 실행");
		model.addAttribute("count", biz.selectCount(keyword));
		//system.out.println("count 실행");

		model.addAttribute("hash", keyword);

		return "hashtag_list";
	}

}
