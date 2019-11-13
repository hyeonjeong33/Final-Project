package com.mvc.inssa.posts.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.posts.dto.PostsDto;

@Repository
public class PostsDaoImpl implements PostsDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PostsDto> selectList(String username) {
		
		//system.out.println("post dao 유저네임 : "+username);
		List<PostsDto> list = new ArrayList<PostsDto>();	
		
		try {
			list = sqlSession.selectList(namespace+"post_list",username);
			//system.out.println("daoimpl");
		} catch (Exception e) {
			//system.out.println("select list error");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public PostsDto selectOne(int postnum) {
	
		PostsDto dto = sqlSession.selectOne(namespace+"post_detail",postnum);
		
		return dto;
	}

	@Override
	public int insert(PostsDto dto) {
		
		int res = 0;
		
		res = sqlSession.insert(namespace+"post_add",dto);
		
		return res;
	}
	
	
	
	@Override
	public List<PostsDto> hashtagList(String hashtag) {
		
		List<PostsDto> list = new ArrayList<PostsDto>();	
		
		try {
			list = sqlSession.selectList(namespace+"hashtag_list",hashtag);
		} catch (Exception e) {
			//system.out.println("hashtag list error");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	@Override
	public List<PostsDto> searchlist(String keyword) {
		
		List<PostsDto> list = new ArrayList<PostsDto>();	
		
		try {
			list = sqlSession.selectList(namespace+"searchlist",keyword);
		} catch (Exception e) {
			//system.out.println("searchlist error");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	@Override
	public List<PostsDto> searchlist1(String keyword) {
		
		List<PostsDto> list = new ArrayList<PostsDto>();	
		
		try {
			list = sqlSession.selectList(namespace+"searchlist1",keyword);
		} catch (Exception e) {
			//system.out.println("searchlist error");
			e.printStackTrace();
		}
		
		
		return list;
	}	
	
	@Override
	public List<PostsDto> searchlist2(String keyword) {
		
		List<PostsDto> list = new ArrayList<PostsDto>();	
		
		try {
			list = sqlSession.selectList(namespace+"searchlist2",keyword);
		} catch (Exception e) {
			//system.out.println("searchlist error");
			e.printStackTrace();
		}
		
		
		return list;
	}	
	
	@Override
	public int selectCount(String keyword) {
		
		int res = 0;
		List<PostsDto> list = new ArrayList<PostsDto>();	
		
		try {
			res = sqlSession.selectOne(namespace+"selectCount",keyword);
		} catch (Exception e) {
			//system.out.println("searchlist error");
			e.printStackTrace();
		}
		
		
		return res;
	}	

//	@Override
//	public int update(PostsDto dto) {
//		
//		int res = 0;
//		
//		try {
//			res = sqlSession.update(namespace+"update", dto);
//		} catch (Exception e) {
//			//system.out.println("update error");
//			e.printStackTrace();
//		}
//		
//		
//		return res;
//	}
//
	@Override
	public int delete(int boardnum) {
		
		int res = 0;
		
		try {
			 res = sqlSession.delete(namespace+"deletePost",boardnum);
		} catch (Exception e) {
			//system.out.println("delete error");
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	   public List<PostsDto> selectTimePosts(String username) {
	      // TODO Auto-generated method stub
	      List<PostsDto> timePostsList=new ArrayList<PostsDto>();
	      timePostsList=sqlSession.selectList(namespace+"selectTimePosts", username);
	      return timePostsList;
	   }   

}
