package com.mvc.inssa.friend.biz;

import java.util.List;

import com.mvc.inssa.friend.dto.FriendDto;

public interface FriendBiz {
	
	public int insertFriend(FriendDto dto);
	public List<FriendDto> selectList(String username);
	public List<FriendDto> selectRequestList(String username);
	public int countRequest(String username);
	public int deleteRequest(String username,String friend);
	public int updateRequest(FriendDto dto);
	public int insertPairRequest(FriendDto dto);
	public int removeCurrentList(String username,String friend);
	public List<String> friend_confirm(String username);

}
