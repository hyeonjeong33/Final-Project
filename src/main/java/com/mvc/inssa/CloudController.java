package com.mvc.inssa;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.inssa.cloud.biz.CloudBiz;
import com.mvc.inssa.cloud.dto.CloudDto;


@Controller
public class CloudController {
   
   @Resource(name="sessionRegistry")
   private SessionRegistryImpl sessionRegistry;
   
   @Autowired
   private CloudBiz cloudBiz;
   
   @RequestMapping("/cloudUpload.do")
   public String cloudUpload(MultipartHttpServletRequest mtfRequest,@ModelAttribute CloudDto dto, Principal principal) {
      mtfRequest.getContextPath();
      //system.out.println("업로드 구문");
      List<MultipartFile> fileList = mtfRequest.getFiles("file");
//      String path = "./testfolder";
      String path = mtfRequest.getSession().getServletContext().getRealPath("/resources/uploadimage");
      File dir = new File(path); 
      if (!dir.isDirectory()) { 
         dir.mkdirs(); 
         }      
      for (MultipartFile mf : fileList) {
         String originFileName = mf.getOriginalFilename(); // 원본 파일 명
         long fileSize = mf.getSize(); // 파일 사이즈
         String content=path+"/"+originFileName;
         dto.setContent(content);
         String contentname=originFileName;
         dto.setContentname(contentname);
         //system.out.println("불러올경로?: "+content);
         //system.out.println("originFileName : " + originFileName);
         //system.out.println("fileSize : " + fileSize);
//         String safeFile = path +"/"+ System.currentTimeMillis() + originFileName;
         String safeFile = path+"/"+originFileName;

         //system.out.println("세이프파일?"+safeFile);
         int res=0;
         try {
            mf.transferTo(new File(safeFile));
            if(mf==fileList.get(0)) {
               res=cloudBiz.insert(dto);
               //system.out.println("타지마");
            }else {
               res=cloudBiz.nextInsert(dto);
               	//system.out.println("제발");
            }
            
            if(res>0) {
               //system.out.println("성공");
            }else {
               //system.out.println("실패");
            }   
         } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }

      return "redirect:cloud_select_photo.do?username="+principal.getName();
   }
   @RequestMapping("/gotoUpload.do")
	public String gotoUpload(Model model,String username) {
		//system.out.println("폴더가 이미있고 이미지+폴더생성하로감");
		//datalist용
		model.addAttribute("folderdata", cloudBiz.selectFolderList(username));
		
		
		return "cloud/cloud_upload";
	}
   @RequestMapping("/createFolder.do")
	public String createFolder(Model model,String username) {
		//system.out.println("컨트롤러에서 createFolder.jsp로 이동");

		return "cloud/createFolder";
	}
   @ResponseBody
   @RequestMapping("/createOnlyFolder.do")
	public String createOnlyFolder(Model model,@ModelAttribute CloudDto dto) {
		//system.out.println("팝업창에서 submit누르면 옴");
		//system.out.println("사용자 이름 :" + dto.getUsername());
		cloudBiz.insertFolder(dto);
//		model.addAttribute("folderdata", cloudBiz.selectFolderList());
		
		//system.out.println("여기오냐");
		return "cloud/cloud_select_photo";
	}
   
   @RequestMapping("/mycloud_photo.do")
   public String mycloudPhoto(Model model,String username,Principal principal,String cloudfolder) { 
	  
	   //system.out.println(cloudfolder);
      //system.out.println("사진리스트");
      
      model.addAttribute("photo", cloudBiz.selectList(username,cloudfolder));
      
      return "cloud/mycloud_photo";
   }
   @RequestMapping("/cloud_select_photo.do")
   public String cloudPhoto(Model model,String username,Principal principal) { 
      
      //system.out.println("첫째메뉴에서 사진/동영상 사진 선택 username받아옴 ");
      //system.out.println(" 동시에 폴더 리스트 띄움");
      
      model.addAttribute("folder", cloudBiz.selectFolderList(username));
      
      return "cloud/cloud_select_photo";
   }
   
   @RequestMapping("/photo_muldel.do")
   @ResponseBody
   public String photo_muldel(int[] numlist) {
	   for(int i=0 ; i<numlist.length ; i++) {
		   //system.out.println("삭제할 사진번호 : "+numlist[i]);
		   cloudBiz.photo_muldel(numlist[i]);
	   }
	   return "home.do";
   }
   
   @RequestMapping("/folder_muldel.do")
   @ResponseBody
   public String folder_muldel(String[] namelist) {
	   for(int i=0 ; i<namelist.length ; i++) {
		   //system.out.println("삭제할 사진번호 : "+namelist[i]);
		   cloudBiz.folder_muldel(namelist[i]);
	   }
	   return "home.do";
   }

}