package com.mvc.inssa.user.dto;


import java.sql.Date;	
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



@SuppressWarnings("serial")
public class UserDto implements UserDetails {


	
	private String username;
	private String password;
	private String authority;
	private int enabled;
	private String nickname;
	private String gender;
	private String email;
	private Date birth;
	private String usermini;
	private String bgm;
	private String status;

	
	
	public UserDto() {
		super();
	}

	public String getBgm() {
		return bgm;
	}

	public void setBgm(String bgm) {
		this.bgm = bgm;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public UserDto(String username, String password, String authority, int enabled, String nickname,
			String gender, String email, Date birth,  String usermini, String bgm, String status) {
		super();
		this.username = username;
		this.password = password;
		this.authority = authority;
		this.enabled = enabled;
		this.nickname = nickname;
		this.gender = gender;
		this.email = email;
		this.birth = birth;
		this.usermini = usermini;
		this.bgm=bgm;
		this.status=status;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	

	public String getUsermini() {
		return usermini;
	}

	public void setUsermini(String usermini) {
		this.usermini = usermini;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		 ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
	        auth.add(new SimpleGrantedAuthority(authority));
	        return auth;


	
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub		
		if(enabled==0) {
			return false;
		}else {
			return true;
		}
		
	}
//	getAuthorities()
//
//	 Collection<? extends   GrantedAuthority>
//
//	 계정이 갖고있는 권한 목록을 리턴한다.
//
//	 getPassword()
//
//	 String
//
//	 계정의 비밀번호를 리턴한다.
//
//	 getUsername()
//
//	 String
//
//	 계정의 이름을 리턴한다.
//
//	 isAccountNonExpired()
//
//	 boolean
//
//	 계정이 만료되지 않았는 지 리턴한다. (true: 만료안됨)
//
//	 isAccountNonLocked()
//
//	 boolean
//
//	 계정이 잠겨있지 않았는 지 리턴한다. (true: 잠기지 않음)
//
//	 isCredentialNonExpired()
//
//	 boolean
//
//	 비밀번호가 만료되지 않았는 지 리턴한다. (true: 만료안됨)
//
//	 isEnabled()
//
//	 boolean
//
}
