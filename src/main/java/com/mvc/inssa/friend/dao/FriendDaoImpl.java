package com.mvc.inssa.friend.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.friend.dto.FriendDto;

@Repository
public class FriendDaoImpl implements FriendDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFriend(FriendDto dto) {

		int res = 0;
		res = sqlSession.insert(namespace + "insertFriend", dto);
		return res;
	}

	@Override
	public List<FriendDto> selectList(String username) {
		List<FriendDto> friendList = new ArrayList<FriendDto>();
		friendList = sqlSession.selectList(namespace + "friendList", username);
		return friendList;
	}

	@Override
	public int countRequest(String username) {
		int count = sqlSession.selectOne(namespace + "countRequest", username);

		//system.out.println(count);
		return count;
	}

	@Override
	public List<FriendDto> selectRequestList(String username) {
		List<FriendDto> requestList = new ArrayList<FriendDto>();
		//system.out.println("왓나요");
		requestList = sqlSession.selectList(namespace + "requestList", username);
		return requestList;
	}

	@Override
	public int deleteRequest(String username, String friend) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("friend", friend);

		int res = sqlSession.delete(namespace + "deleteRequest", map);
		if (res > 0) {
			//system.out.println("성공");
		} else {
			//system.out.println("실패");
		}
		return res;
	}

	@Override
	public int updateRequest(FriendDto dto) {
		int res = 0;
		res = sqlSession.update(namespace + "updateRequest", dto);

		return 0;
	}

	@Override
	public int insertPairRequest(FriendDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.insert(namespace + "insertPairRequest", dto);
		return res;
	}

	@Override
	public int removeCurrentList(String username, String friend) {
		int res = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("friend", friend);

		res = sqlSession.delete(namespace + "removeCurrentList", map);
		return res;
	}

	@Override
	public List<String> friend_confirm(String username) {
		List<String> list = new ArrayList<String>();
		list = sqlSession.selectList(namespace + "friend_confirm", username);
		//system.out.println("frienddaoimpl list : " + list);
		return list;
	}

}
