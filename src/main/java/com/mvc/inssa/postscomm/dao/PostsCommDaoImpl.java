package com.mvc.inssa.postscomm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.guestbookcomm.dto.GuestBookCommDto;
import com.mvc.inssa.postscomm.dto.PostsCommDto;

@Repository
public class PostsCommDaoImpl implements PostsCommDao {

   @Autowired 
   private SqlSessionTemplate sqlSession;
   
   @Override
   public List<PostsCommDto> selectList() {
      
      List<PostsCommDto> list = new ArrayList<PostsCommDto>();
      
      try {
         list = sqlSession.selectList(namespace+"selectList");
      } catch (Exception e) {
         //system.out.println("PostsCommDaoImpl error");
         e.printStackTrace();
      }
      
      //system.out.println(list.size());
      
      return list;
   }

   @Override
   public int insert(PostsCommDto dto) {

      int res = 0;
      
      res = sqlSession.insert(namespace+"insert",dto);
      
      return res;
   }
   @Override
   public int add_comm(PostsCommDto dto) {
      
      int res = 0;
      
      res = sqlSession.insert(namespace+"add_comm",dto);
      
      return res;
   }

   @Override
   public int update(PostsCommDto dto) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int delete(int commnum) {
      
      int res = 0;
      
      try {
         res = sqlSession.delete(namespace+"delete",commnum);
      } catch (Exception e) {
         //system.out.println("Comm delete Error");
         e.printStackTrace();
      }
      
      
      return res;
   }

   @Override
   public PostsCommDto rownumone() {
      
      PostsCommDto dto = sqlSession.selectOne(namespace+"rownumone");
      
      return dto;
   }

   @Override
   public PostsCommDto rownumresult(int rownumone) {
      Map<String, Integer> map = new HashMap<String, Integer>();
      map.put("commnum", rownumone);
      PostsCommDto dto = sqlSession.selectOne(namespace+"babo", map);
      
      return dto; 
   }


}