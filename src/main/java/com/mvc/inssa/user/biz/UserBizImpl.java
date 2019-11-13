package com.mvc.inssa.user.biz;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mvc.inssa.user.dao.UserDao;
import com.mvc.inssa.user.dto.UserDto;

@Service
public class UserBizImpl implements UserBiz {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao dao;

	@Override
	public List<UserDto> user_list() {
		return dao.user_list();
	}

	@Override
	public UserDto user_detail(String username) {
		return dao.user_detail(username);
	}

	@Override
	public int user_add(UserDto dto) {
		return dao.user_add(dto);
	}

	@Override
	public int user_update(UserDto dto, Principal principal) {
		return dao.user_update(dto, principal);
	}

	@Override
	public int user_delete(String username) {
		return dao.user_delete(username);
	}

	@Override
	public int id_check(String username) {
		return dao.id_check(username);
	}

	@Override
	public int email_check(String email) {
		return dao.email_check(email);
	}

	@Override
	public String find_id_by_nickname(String nickname, String email) {
		return dao.find_id_by_nickname(nickname, email);
	}

	@Override
	public String find_pw_by_username(String username) {
		return dao.find_pw_by_username(username);
	}

	@Override
	public int change_pass(String username, String password) {
		return dao.change_pass(username, password);
	}

	@Override
	public UserDto select_mini(String username) {
		return dao.select_mini(username);
	}

	public int update_mini(UserDto dto) {
		return dao.update_mini(dto);
	}

	@Override
	public List<UserDto> recommend_friend(String username) {
		// TODO Auto-generated method stub
		return dao.recommend_friend(username);
	}

	@Override
	public List<UserDto> my_friend(String username) {
		
		return dao.my_friend(username);
	}

}
