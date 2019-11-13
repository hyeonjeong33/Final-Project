package com.mvc.inssa.user.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mvc.inssa.user.dao.UserDao;

public class UserDtoService implements UserDetailsService{
	
	 @Autowired
	    private UserDao userDAO;


	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDto user = userDAO.getUserById(username);
	        if(user==null) {
	            throw new UsernameNotFoundException(username);
	        }
	        return user;
	    }


	
	}


