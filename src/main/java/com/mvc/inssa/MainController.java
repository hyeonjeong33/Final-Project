package com.mvc.inssa;



import java.security.Principal;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.inssa.user.biz.UserBiz;
import com.mvc.inssa.user.dto.UserDto;



@Controller
public class MainController {
	@Resource(name="sessionRegistry")
	private SessionRegistryImpl sessionRegistry;
	
	@Autowired
	private UserBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/profile.do")
	public String goto_profile(Principal principal) {
		
		System.out.print("profile : ");
		
		//system.out.println(principal.getName());
		
		
		return "profile_form";
		
	}
	@RequestMapping("/profile_home.do")
	public String goto_profile_update(Principal principal) {
		
		//system.out.println(principal.getName());
		
		
		
		return "profile_home";
		
	}
	
	   @RequestMapping(value = "/edit_mini.do", method = RequestMethod.GET)
	   public String edit_mini(Locale locale, Model model) {
	      logger.info("미니미를 바구자");
	      
	      return "edit_mini";
	   }
	   
	   @RequestMapping(value = "/update_mini.do", method = RequestMethod.POST)
	   public String update_mini(Model model, @ModelAttribute UserDto dto) {      
	      logger.info("미니미를 저장하자");
	      
//	      dto.setUsername(username);
//	      dto.setUsermini(usermini);
	      
	      //system.out.println("username : " +    dto.getUsername());
	      //system.out.println("usermini :" +dto.getUsermini());
	      
	      //db 연결(biz 호출해서 biz는 dao 호출)
	      int res = biz.update_mini(dto);   
	      
	      if(res>0) {
	         //system.out.println("수정 완료");
	         return "redirect:home.do";
	      } else {
	         //system.out.println("수정 실패");
	         return "redirect:home.do";
	      }
	      
	   }
	
}
