package com.mvc.inssa.postscomm.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.inssa.postscomm.dao.PostsCommDao;
import com.mvc.inssa.postscomm.dto.PostsCommDto;

@Service
public class PostsCommBizImpl implements PostsCommBiz{

   @Autowired
   private PostsCommDao dao;
   
   @Override
   public List<PostsCommDto> selectList() {
      return dao.selectList();
   }

   @Override
   public int insert(PostsCommDto dto) {
      return dao.insert(dto);
   }

   @Override
   public int delete(int commnum) {
      return dao.delete(commnum);
   }

   @Override
   public PostsCommDto rownumone() {
      return dao.rownumone();
   }

   @Override
   public PostsCommDto rownumresult(int rownumone) {
      return dao.rownumresult(rownumone);
   }

   @Override
   public int add_comm(PostsCommDto dto) {
      return dao.add_comm(dto);
   }

   @Override
   public int update(PostsCommDto dto) {
      // TODO Auto-generated method stub
      return 0;
   }

}