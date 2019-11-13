package com.mvc.inssa.posts.dao;

import java.util.List;

import com.mvc.inssa.posts.dto.PostsDto;

public interface PostsDao {

	final String namespace = "mola.";

	public List<PostsDto> selectList(String username);

	public PostsDto selectOne(int postnum);

	public int insert(PostsDto dto);

	public List<PostsDto> hashtagList(String hashtag);

	public List<PostsDto> searchlist(String keyword);

	public List<PostsDto> searchlist1(String keyword);

	public List<PostsDto> searchlist2(String keyword);

	public int selectCount(String keyword);

	public int delete(int boardnum);

	// 타임라인출력
	public List<PostsDto> selectTimePosts(String username);
}
