package com.mvc.inssa.user.dao;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.user.dto.UserDto;
import com.mvc.inssa.user.dto.UserDtoService;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<UserDto> user_list() {
		List<UserDto> list = new ArrayList<UserDto>();

		try {
			list = sqlSession.selectList(namespace + "user_list");
		} catch (Exception e) {
			//system.out.println("회원 리스트 가져오기 실패");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public UserDto user_detail(String username) {
		UserDto dto = sqlSession.selectOne(namespace + "user_detail", username);

		return dto;
	}

	@Override
	public int user_add(UserDto dto) {
		//system.out.println("회원가입 -> 이름:"+dto.getUsername()+"/패스워드:"+dto.getPassword()+"/이메일:"+dto.getEmail());
		
		int res = 0;
		try {
			//system.out.println("회원가입 매핑 전");
			res = sqlSession.insert(namespace + "user_add", dto);
			//system.out.println("회원가입 매핑 후");
		} catch (Exception e) {
			//system.out.println("회원 추가 실패");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int user_update(UserDto dto, Principal principal) {
		int res = 0;

		try {
			//system.out.println("Principal : " + principal.getName());
			
			dto.setUsername(principal.getName());
			//system.out.println("다오임플 -> 닉네임 : " + dto.getNickname() + " / 패스워드 : " + dto.getPassword());
			//system.out.println("다오임플 유저네임 : " + dto.getUsername());
			//system.out.println("다오임플 상태메시지 : " + dto.getStatus());
			res = sqlSession.update(namespace + "user_update", dto);
			//system.out.println(res);
		} catch (Exception e) {
			//system.out.println("회원 수정 실패");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int user_delete(String username) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"user_delete", username);
		} catch (Exception e) {
			//system.out.println("회원 삭제 실패");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int id_check(String username) {
		int a=0;
		//system.out.println("dao : "+username);
	
		
		try {
			//system.out.println("매퍼전");
			a = sqlSession.selectOne(namespace+"id_chk", username);
			//system.out.println(a);
			//system.out.println("매퍼후");
		} catch (Exception e) {
			//system.out.println("아이디 체크 실패");
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int email_check(String email) {
		int chk = 0;
		UserDto dto = new UserDto();
		
		try {
			//system.out.println("매퍼전");
			chk = sqlSession.selectOne(namespace+"email_chk", email);
			//system.out.println(chk);
			//system.out.println("매퍼후");
		} catch (Exception e) {
			//system.out.println("이메일 체크 실패");
			e.printStackTrace();
		}
		
		return chk;
	}
//springsecurity
	@Override
	public UserDto getUserById(String username) {
		//system.out.println("마이바티스가 됫다고?");
		 return sqlSession.selectOne(namespace+"selectUserById", username);

	}
	
	@Override
	public String find_id_by_nickname(String nickname, String email) {
		//system.out.println("아이디 찾을 닉네임 : "+nickname);
		String receive_id = null;
		
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("nickname",nickname);
			map.put("email",email);
			receive_id = sqlSession.selectOne(namespace+"find_id_by_nickname", map);
			//system.out.println(nickname+"으로 찾은 아이디 : "+receive_id);
		} catch (Exception e) {
			//system.out.println("회원아이디 찾기 실패");
			e.printStackTrace();
		}
		
		return receive_id;
	}

	@Override
	public String find_pw_by_username(String username) {
		//system.out.println("비밀번호 찾을 아이디 : "+username);
		String receive_password = null;
		
		try {
			receive_password = sqlSession.selectOne(namespace+"find_pw_by_id", username);
			//system.out.println(username+"으로 찾은 비밀번호 : "+receive_password);
		} catch (Exception e) {
			//system.out.println("회원비밀번호 찾기 실패");
			e.printStackTrace();
		}
		
		return receive_password;
	}

	@Override
	public int change_pass(String username, String password) {
		//system.out.println("유저아이디 : "+username+" / 바꿀 비밀 번호 : "+password);
		int res = 0;
		
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("username",username);
			map.put("password",password);
			res = sqlSession.update(namespace+"change_pass", map);
			//system.out.println("임시비밀번호 daoimpl 리턴값 : "+res);
		} catch (Exception e) {
			//system.out.println("임시비밀번호설정 실패");
			e.printStackTrace();
		}
		
		return res;
	}
	
	   @Override
	   public UserDto select_mini(String username) {
	      //system.out.println("dao : " + username);
	      
	      UserDto dto = sqlSession.selectOne(namespace + "select_mini", username);

	      return dto;
	   }

	   @Override
	   public int update_mini(UserDto dto) {
	      //system.out.println("다오임플왓어요");
	      int res = 0;

	      try {      
	         res = sqlSession.update(namespace + "update_mini", dto);
	      } catch (Exception e) {
	         //system.out.println("미니미 수정 실패");
	         e.printStackTrace();
	      }

	      return res;
	   }

	@Override
	public List<UserDto> recommend_friend(String username) {
		List<UserDto> recommendlist = new ArrayList<UserDto>();
		recommendlist=sqlSession.selectList(namespace+"recommend_friend",username);
		return recommendlist;
	}

	@Override
	public List<UserDto> my_friend(String username) {
		List<UserDto> myFriendList = new ArrayList<UserDto>();
		myFriendList=sqlSession.selectList(namespace+"my_friend",username);
		return myFriendList;
	}
	
	

}
