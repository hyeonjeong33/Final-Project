package com.mvc.inssa.friend.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.inssa.friend.dao.FriendDao;
import com.mvc.inssa.friend.dto.FriendDto;

@Service
public class FriendBizImpl implements FriendBiz {
	@Autowired
	private FriendDao dao;

	@Override
	public int insertFriend(FriendDto dto) {
		return dao.insertFriend(dto);
	}

	@Override
	public List<FriendDto> selectList(String username) {
		//system.out.println("하위");
		return dao.selectList(username);
	}

	@Override
	public int countRequest(String username) {
		return dao.countRequest(username);
	}

	@Override
	public List<FriendDto> selectRequestList(String username) {
		return dao.selectRequestList(username);
	}

	@Override
	public int deleteRequest(String username, String friend) {
		//system.out.println("오나용");
		return dao.deleteRequest(username, friend);
	}

	@Override
	public int updateRequest(FriendDto dto) {

		return dao.updateRequest(dto);
	}

	@Override
	public int insertPairRequest(FriendDto dto) {
		return dao.insertPairRequest(dto);
	}

	@Override
	public int removeCurrentList(String username, String friend) {
		return dao.removeCurrentList(username, friend);
	}

	@Override
	public List<String> friend_confirm(String username) {
		return dao.friend_confirm(username);
	}

}
