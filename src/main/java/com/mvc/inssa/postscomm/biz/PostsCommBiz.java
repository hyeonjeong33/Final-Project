package com.mvc.inssa.postscomm.biz;

import java.util.List;

import com.mvc.inssa.postscomm.dto.PostsCommDto;

public interface PostsCommBiz {

   public List<PostsCommDto> selectList();
   public int insert(PostsCommDto dto);
   public int update(PostsCommDto dto);
   public int add_comm(PostsCommDto dto);
   public int delete(int commnum);
   public PostsCommDto rownumone();
   public PostsCommDto rownumresult(int rownumone);
}