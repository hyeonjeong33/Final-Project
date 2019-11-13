package com.mvc.inssa;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.inssa.GuestBook.biz.GuestBookBiz;
import com.mvc.inssa.GuestBook.dto.GuestBookDto;
import com.mvc.inssa.friend.biz.FriendBiz;
import com.mvc.inssa.friend.dto.FriendDto;
import com.mvc.inssa.guestbookcomm.biz.GuestBookCommBiz;
import com.mvc.inssa.posts.biz.PostsBiz;
import com.mvc.inssa.user.biz.UserBiz;
import com.mvc.inssa.user.dto.UserDto;

@Controller
public class FriendController {

   @Resource(name = "sessionRegistry")
   private SessionRegistryImpl sessionRegistry;

   @Autowired
   private UserBiz userbiz;
   @Autowired
   private FriendBiz friendbiz;
   @Autowired
   private PostsBiz postbiz;
   @Autowired
   private GuestBookBiz guestbiz;
   @Autowired
   private GuestBookCommBiz guestcommbiz;

   // 친구신청하기
   @RequestMapping("/addFriends.do")
   public String addFriend(Principal principal, Model model, String friendname, FriendDto dto) {
      //system.out.println(friendname);
      String username = principal.getName();
      dto.setUsername(username);
      dto.setFriend(friendname);
      friendbiz.insertFriend(dto);

      // 친구신청상황
      return "redirect:current_friend_list.do";
   }

   // 친구신청상황 페이지에 띄우고 이동하기위함
   @RequestMapping("/current_friend_list.do")
   public String currentFriendList(Model model, Principal principal) {
      String username = principal.getName();
      model.addAttribute("friendList", friendbiz.selectList(username));

      return "friend/current_friend_list";

   }

   @RequestMapping("/friendRequest.do")
   public String friendRequest(Model model, Principal principal, HttpSession session) {
      String username = principal.getName();
      //system.out.println(username);
      model.addAttribute("friendRequest", friendbiz.selectRequestList(username));
      session.setAttribute("friendRequest", friendbiz.countRequest(principal.getName()));

      return "friend/friend_request_list";

   }

   @RequestMapping("/requestDelete.do")
   public String requestDelete(Principal principal, String username) {
      String friend = principal.getName();

      friendbiz.deleteRequest(username, friend);

      return "redirect:friendRequest.do";

   }

   @RequestMapping("/requestUpdate.do")
   public String requestUpdate(Model model, Principal principal, @ModelAttribute FriendDto dto, String username) {
      dto.setUsername(username);
      dto.setFriend(principal.getName());

      //system.out.println(dto.getUsername());
      //system.out.println(dto.getFriend());

      int res = 0;
      res = friendbiz.updateRequest(dto);
      int pair = 0;
      pair = friendbiz.insertPairRequest(dto);
      if (res > 0) {
         //system.out.println("성공");
      } else {
         //system.out.println("안해");
      }

      return "redirect:friendRequest.do";

   }

   // 요청취소 버튼
   @RequestMapping("/remove_current_list.do")
   public String removeCurrentList(Principal principal, String friend) {

      friendbiz.removeCurrentList(principal.getName(), friend);

      return "redirect:current_friend_list.do";

   }
   
   @RequestMapping("/friendhome.do")
   public String friendhome(String username, HttpSession session, Model model, Principal principal) {
      //system.out.println(username+"의 홈으로 들어와따!!");
      model.addAttribute("frienddto", userbiz.user_detail(username));
      //system.out.println("친구의 usermini : "+userbiz.user_detail(username).getUsermini());
      session.setAttribute("friendsFriends", userbiz.my_friend(username));
      model.addAttribute("list", postbiz.selectList(username));
      //system.out.println(postbiz.selectList(username));
      
      List<String> list = friendbiz.friend_confirm(principal.getName());
      //system.out.println("친구 목록 : "+list);
      //system.out.println("친구확인 : "+list.contains(username));
      model.addAttribute("confirm", list.contains(username));
      return "friendhome";
   }
   
   @RequestMapping("/friendVisitor.do")
   public String friendVisitor(String username, Model model, Principal principal) {
      //system.out.println(username+"의 방명록으로 들어와따!!");
      
      List<GuestBookDto> list1 = new ArrayList<GuestBookDto>();
      //system.out.println("센드투+유저네임"+username+principal.getName());
      list1 = guestbiz.selectList_friend(username, principal.getName());  // (username <- sendto인상태고 , username <- myname 받아와야함 지금 현재는 없음)
      List<UserDto> newlist = new ArrayList<UserDto>();
      for(int i=0 ; i<list1.size() ; i++) {
         newlist.add(userbiz.user_detail(list1.get(i).getUsername()));
      }
      model.addAttribute("guestdto", newlist);
      
      model.addAttribute("friendguestlist", guestbiz.selectList_friend(username, principal.getName()));
      //system.out.println(username+"의 방명록 리스트 : "+guestbiz.selectList_friend(username, principal.getName()));
      model.addAttribute("frienddto", userbiz.user_detail(username));
      
      List<String> list2 = friendbiz.friend_confirm(principal.getName());
      model.addAttribute("comm", guestcommbiz.selectList());
      model.addAttribute("confirm", list2.contains(username));
      return "friendVisitor";
   }

}