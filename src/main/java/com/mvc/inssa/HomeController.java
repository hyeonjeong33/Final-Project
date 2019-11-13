package com.mvc.inssa;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.inssa.email.MakeRandom;
import com.mvc.inssa.friend.biz.FriendBiz;
import com.mvc.inssa.posts.biz.PostsBiz;
import com.mvc.inssa.posts.dto.PostsDto;
import com.mvc.inssa.postscomm.biz.PostsCommBiz;
import com.mvc.inssa.user.biz.UserBiz;
import com.mvc.inssa.user.dto.UserDto;

@Controller
public class HomeController {
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Resource(name = "sessionRegistry")
	private SessionRegistryImpl sessionRegistry;

	private String randompassword;

	@Autowired
	private UserBiz biz;
	@Autowired
	private FriendBiz fbiz;
	@Autowired
	private PostsBiz pbiz;
	@Autowired
	private PostsCommBiz postsCommbiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 메인화면
	@RequestMapping(value = "/home.do")
	   public String home(Locale locale, Model model, Principal principal, HttpSession session) {
	      // 권한을 갖고 있는 사용자의 수와 총원
	      session.setAttribute("users", sessionRegistry.getAllPrincipals());
	      session.setAttribute("total", sessionRegistry.getAllPrincipals().size());
	      // left_home의 model
	      //system.out.println("현재 로그인 되어있는 username : " + principal.getName());
	      session.setAttribute("dto", biz.user_detail(principal.getName()));
	      // 추천친구들 보여주기
	      session.setAttribute("recommendFriends", biz.recommend_friend(principal.getName()));
	      // 나의친구 보여주기
	      session.setAttribute("myFriends", biz.my_friend(principal.getName()));
	      // 친구요청 알림함.
	      //system.out.println("!!");
	      session.setAttribute("friendRequest", fbiz.countRequest(principal.getName()));
	      //system.out.println("!사이에서 left에 뿌려줌");
	      
	      
	      
	      session.setAttribute("timelinePosts", pbiz.selectTimePosts(principal.getName()));
	      session.setAttribute("comm", postsCommbiz.selectList());
	      
	      // 해당 게시물의 유저Dto
	      List<PostsDto> postlist = new ArrayList<PostsDto>();
	      List<UserDto> newpostlist = new ArrayList<UserDto>();
	      postlist = pbiz.selectTimePosts(principal.getName());
	      for(int i=0 ; i<postlist.size() ; i++) {
	         newpostlist.add(biz.user_detail(postlist.get(i).getUsername()));
	      }
	      //system.out.println("게시판 주인 Dto : "+newpostlist);
	      model.addAttribute("postmaster", newpostlist);
	      
	      return "home";
	   }

	@RequestMapping(value = "/chat.do")
	public String chat(Locale locale, Model model, Principal principal, HttpSession session) {
//    	//권한을 갖고 있는 사용자의 수와 총원
//    	session.setAttribute("users", sessionRegistry.getAllPrincipals());
//    	session.setAttribute("total", sessionRegistry.getAllPrincipals().size());
//    	// left_home의 model
//    	//system.out.println("현재 로그인 되어있는 username : "+principal.getName());
		session.setAttribute("dto", biz.user_detail(principal.getName()));
		//system.out.println("session : " + session);
		return "chat";
	}

	// 로그인화면
	@RequestMapping(value = "/loginForm.do")
	public String loginForm(Locale locale, Model model) {
		logger.info("Welcome Login Form!");

		return "loginForm";
	}

	// 회원가입하로가기
	@RequestMapping("/signUp")
	public String signUp(Locale locale, HttpSession session) {
		logger.info("Welcome signUp!");
		String randomnumber = MakeRandom.GetRandomPassword();
		session.setAttribute("origin_randnum", randomnumber);
		return "sign_up";

	}

	// 회원가입완료
	@RequestMapping("/sign_up.do")
	public String sign_up(@ModelAttribute UserDto dto) {
		int res = 0;
		String encPassword = bCryptPasswordEncoder.encode(dto.getPassword());
		//system.out.println("비밀번호 암호화" + encPassword);
		dto.setPassword(encPassword);
		res = biz.user_add(dto);
		//system.out.println("sign_up의 res : " + res);
		//system.out.println("가입할 정보의 아이디:" + dto.getUsername() + " 이름:" + dto.getNickname());

		if (res > 0) {
			return "loginForm";
		} else {
			return "redirect:sign_up.do";
		}

	}

	// 채팅하기
	@RequestMapping("/chatting")
	public String chatting(Locale locale, Model model) {
		logger.info("Welcome chatting!");

		return "chat";
	}

	// 수정
	@RequestMapping("/updateform.do")
	public String updateform(Model model, HttpSession session, String id) {

		session.setAttribute("dto", biz.user_detail(id));

		return "updateform";
	}

	// 삭제
	@RequestMapping("/delete.do")
	public String delete(String id) {

		int res = biz.user_delete(id);

		if (res > 0) {
			return "redirect: list.do";
		} else {
			return "redirect: list.do";
		}
	}

	@RequestMapping("/id_check.do")
	@ResponseBody
	public Map<Object, Object> id_check(@RequestParam String username) {

		//system.out.println("~~~~~~여기로 오거라~~~~~~~");

		//system.out.println(username);
		int count = 0;

		Map<Object, Object> map = new HashMap<Object, Object>();

		count = biz.id_check(username);
		//system.out.println("컨트롤러 count" + count);
		map.put("cnt", count);

		return map;
	}

	@RequestMapping("/email_check.do")
	@ResponseBody
	public Map<String, Object> email_check(String email) {

		//system.out.println(email);

		Map<String, Object> map = new HashMap<String, Object>();
		int count = 0;

		count = biz.email_check(email);
		//system.out.println("컨트롤러 email_count" + count);
		map.put("cnt", count);

		return map;
	}

	@RequestMapping("/send_email.do")
	@ResponseBody
	public void send_email(String email, String origin_randnum) throws UnsupportedEncodingException, MessagingException {
		System.out.println("보낼 인증번호 : " + origin_randnum);
		int res = 0;

		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPassword("1q2winssa3e4r");
		mailSender.setPort(587);
		mailSender.setUsername("inssaworld@gmail.com");
		if (mailSender.getPort() == 587) {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(javaMailProperties);
		}

		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, false, "UTF-8");
		helper.setFrom(new InternetAddress("insaworld@gmail.com", "인싸월드"));
		helper.setTo(new InternetAddress(email, ""));
		helper.setSubject("[InssaWorld]인증번호");
		helper.setText("<a><b style='color:blue;'>인증번호 : " + origin_randnum + "</b></a>", true);

		try {
			mailSender.send(msg);
		} catch (MailException ex) {
			logger.error("메일발송실패", ex);
		}

	}

	@RequestMapping("/find_email.do")
	@ResponseBody
	public void find_email(String email, String text, String username)
			throws UnsupportedEncodingException, MessagingException {
		randompassword = MakeRandom.GetRandomPassword();
		String encPassword = bCryptPasswordEncoder.encode(randompassword);
		//system.out.println("비밀번호 암호화" + encPassword);
		
		//system.out.println("보낼 인증번호 : " + randompassword);
		//system.out.println("보낼 이메일 : " + email);
		//system.out.println("이메일 상황 : " + text);

		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPassword("1q2winssa3e4r");
		mailSender.setPort(587);
		mailSender.setUsername("inssaworld@gmail.com");
		if (mailSender.getPort() == 587) {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(javaMailProperties);
		}

		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, false, "UTF-8");
		helper.setFrom(new InternetAddress("insaworld@gmail.com", "인싸월드"));
		helper.setTo(new InternetAddress(email, ""));
		if (text.equals("findid")) {
			helper.setSubject("[InssaWorld]아이디찾기");
			helper.setText("<a><b style='color:blue;'>아이디 : " + username + "</b></a>", true);
		} else if (text.equals("findpw")) {
			helper.setSubject("[InssaWorld]비밀번호찾기");
			helper.setText("<a><b style='color:blue;'>임시 비밀번호 : " + randompassword + "</b>로 변경되었습니다."
					+ "</a><br/>로그인 후 다시 변경해 주세요<br/><a href='http://localhost:8787/inssa/' style='text-decoration:none;'>싸이월드로 바로가기</a>",
					true);
			try {
				//system.out.println("임시비번 설정 전");
				biz.change_pass(username, encPassword);
				UserDto dto = biz.user_detail(username);
				//dto.setPassword(encPassword);
				//system.out.println(dto.getPassword());
				//system.out.println("비밀번호 수정 완료");
			} catch (Exception e) {
				//system.out.println("임시 비번 설정 실패");
				e.printStackTrace();
			}
		}

		try {
			mailSender.send(msg);
		} catch (MailException ex) {
			logger.error("메일발송실패", ex);
		}

	}

	@RequestMapping("/randnum_check.do")
	@ResponseBody
	public Map<String, Boolean> randnum_check(String randnum, String origin_randnum) {

		//system.out.println("입력한 인증번호 : " + randnum + " / 원래 인증번호 : " + origin_randnum);
		boolean ranchk = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();

		if (origin_randnum.equals(randnum)) {
			ranchk = true;
			map.put("ranchk", ranchk);
		} else {
			map.put("ranchk", ranchk);
		}

		//system.out.println("인증번호 체크 : " + ranchk);

		return map;
	}

	@RequestMapping("/show_profile.do")
	public String show_profile(String username, HttpSession session) {
		//system.out.println("프로필 가기 전 유저네임 : " + username);
		session.setAttribute("dto", biz.user_detail(username));
		return "profile";
	}

	@RequestMapping("/user_update.do")
	public String user_update(Model model, @ModelAttribute UserDto dto, Principal principal) {
		//system.out.println("업데이트 dto : " + dto);
		String encPassword = bCryptPasswordEncoder.encode(dto.getPassword());
		dto.setPassword(encPassword);
		//system.out.println("비밀번호 암호화" + encPassword);
		int res = 0;
		//system.out.println("유저 업데이트 정보 - 닉네임 : " + dto.getNickname() + " / 패스워드 : " + dto.getPassword());
		res = biz.user_update(dto, principal);
		//system.out.println(res);
		if (res > 0) {
			return "home";
		} else {
			return "home";
		}
	}

	@RequestMapping("/after_update.do")
	public String after_update(String username, HttpSession session) {
		session.setAttribute("dto", biz.user_detail(username));
		return "redirect: home.do";
	}

	@RequestMapping("/user_delete.do")
	public String user_delete(String username) {
		//system.out.println("삭제시 유저네임 : " + username);
		int res = 0;
		res = biz.user_delete(username);
		//system.out.println("삭제후 : " + res);
		if (res > 0) {
			return "home";
		} else {
			return "home";
		}
	}

	@RequestMapping("/after_delete.do")
	public String after_delete() {

		return "loginForm";
	}

	@RequestMapping("/findId.do")
	public String findId() {

		return "findId";
	}

	@RequestMapping("/findIdForm.do")
	public String findIdForm(String email, String nickname) {
		//system.out.println("아이디 찾기 -> 이메일 : " + email + " /  닉네임 : " + nickname);

		String id = biz.find_id_by_nickname(nickname, email);
		//system.out.println("컨트롤러에서의 아이디 : " + id);
		String text = "findid";

		return "redirect:find_email.do?email=" + email + "&text=" + text + "&username=" + id;
	}

	@RequestMapping("/findPw.do")
	public void findPw() {

	}

	@RequestMapping("/findPwForm.do")
	public String findPwForm(String email, String username) {

		//system.out.println("패스워드 찾기 -> 이메일 : " + email + " / 아이디 : " + username);

		String password = biz.find_pw_by_username(username);
		//system.out.println("컨트롤러에서의 패스워드 : " + password);
		String text = "findpw";

		return "redirect:find_email.do?email=" + email + "&text=" + text + "&username=" + username;
	}

	@RequestMapping("/edit_mini.do")
	public String edit_mini() {

		return "edit_mini";
	}

//	메뉴들

	@RequestMapping("/diary.do")
	public String diary(Principal principal, HttpSession session) {
		String id = principal.getName();
		//system.out.println("다이어리에서 현재 로그인 되어있는 아이디 : " + id);
		session.setAttribute("dto", biz.user_detail(id));
		return "diary";
	}

	@RequestMapping("/cloud.do")
	public String cloud(Principal principal) {
		
		//system.out.println("(얘는 homcecontroller 클라우드 첫째메뉴로가기");
		return "redirect:cloud_select_photo.do?username="+principal.getName();
	}

	// 친구추가
	@RequestMapping("/follow.do")
	public void follow(String username, String email) {
		//system.out.println("팔로우 할 사람 : " + username + " | 그 사람의 이메일 : " + email);

	}

}
