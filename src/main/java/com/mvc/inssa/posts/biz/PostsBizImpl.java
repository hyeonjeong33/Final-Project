package com.mvc.inssa.posts.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.inssa.posts.dao.PostsDaoImpl;
import com.mvc.inssa.posts.dto.PostsDto;

@Service
public class PostsBizImpl implements PostsBiz {

	@Autowired
	private PostsDaoImpl dao;
	
	
	@Override
	public List<PostsDto> selectList(String username) {
		return dao.selectList(username);
	}
	
	@Override
	public PostsDto selectOne(int postnum) {
		return dao.selectOne(postnum);
	}
	
	@Override
	public int insert(PostsDto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public List<PostsDto> hashtagList(String hashtag) {
		return dao.hashtagList(hashtag);
	}
	
	@Override
	public List<PostsDto> searchlist(String keyword) {
		return dao.searchlist(keyword);
	}
	
	@Override
	public List<PostsDto> searchlist1(String keyword) {
		return dao.searchlist1(keyword);
	}
	
	@Override
	public List<PostsDto> searchlist2(String keyword) {
		return dao.searchlist2(keyword);
	}	
	
	@Override
	public int selectCount(String keyword) {
		return dao.selectCount(keyword);
	}

	@Override
	public int delete(int boardnum) {
		return dao.delete(boardnum);
	}
	@Override
	   public List<PostsDto> selectTimePosts(String username) {
	      return dao.selectTimePosts(username);
	   }
	   
	
}









//package com.mvc.inssa.posts.biz;
//
//import java.security.Principal;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.mvc.inssa.PostsController;
//import com.mvc.inssa.posts.dto.PostsDto;
//
//
//
//
//public class PostsBizImpl {
//	private static final Logger logger = LoggerFactory.getLogger(PostsController.class);
//	Principal principal;
//	String username=principal.getName();
//	@Autowired
//	private PostsBiz biz;
//	
//	//상세조회
//	@RequestMapping("/postsdetail.do") 
//	public String selectOne(Model model, int boardnum) {
//
//		logger.info("<<<SelectOne>>>");
//		
//		model.addAttribute("dto", biz.selectOne(boardnum));// dto는 selectOne.jsp에서 씀
//		//★comm★은 selectOne.jsp에서 c:when "${empty ★comm★ }"
//		
//		return "postsdetail";
//	}
//	//목록
//	@RequestMapping("/postslist.do")
//	public String selectlist(Model model) { 
//
//		logger.info("<<<List>>>");
//
//	
//		model.addAttribute("dto", biz.selectList(username)); //guestlist는 list.jsp에서 c:when "${empty guestlist}" 
//		
//		return "postslist";
//	}
//	@RequestMapping("/postswrite.do")
//	public String postswrite(@ModelAttribute PostsDto dto) {
//        article.setRegDate(new Date());
//        
//        //system.out.println(article);
//        
//        return "redirect:/article/" + articleRepository.save(article).getId();
//    }
//
//
//	
//	
//	
//	//등록
//	
//	//삭제
//	
//}
