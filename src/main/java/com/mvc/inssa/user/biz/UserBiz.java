package com.mvc.inssa.user.biz;

import java.security.Principal;
import java.util.List;

import com.mvc.inssa.user.dto.UserDto;

public interface UserBiz {
	
	public List<UserDto> user_list();
	public List<UserDto> recommend_friend(String username);
	public List<UserDto> my_friend(String username);
	public UserDto user_detail(String username);
	public int user_add(UserDto dto);
	public int user_update(UserDto dto, Principal principal);
	public int user_delete(String username);
	
	public int id_check(String username);
	public int email_check(String email);
	
	public String find_id_by_nickname(String nickname, String email);
	public String find_pw_by_username(String username);
	
	public int change_pass(String username, String password);

	public UserDto select_mini(String username);
	public int update_mini(UserDto dto);
}
