package com.mvc.inssa.cloud.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.inssa.cloud.dto.CloudDto;

@Repository
public class CloudDaoImpl implements CloudDao{

   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int insert(CloudDto dto) {
      int res=0;
      res=sqlSession.insert(namespace+"insert_image",dto);
      return res;
   }

   @Override
   public int nextInsert(CloudDto dto) {
      int res=0;
      res=sqlSession.insert(namespace+"insert_next_image",dto);
      return res;
   }

   @Override
   public List<CloudDto> selectList(String username,String cloudfolder) {
	   Map<String, Object>map=new HashMap<String, Object>();
	   map.put("username", username);
	   map.put("cloudfolder",cloudfolder);
      List<CloudDto> list=new ArrayList<CloudDto>();
      
      list=sqlSession.selectList(namespace+"selectList",map);
      return list;
   }

	@Override
	public List<CloudDto> selectFolderList(String username) {
		List<CloudDto> folderList=new ArrayList<CloudDto>();
		folderList=sqlSession.selectList(namespace+"selectFolderList",username);
		return folderList;
	}
	
	@Override
	public int insertFolder(CloudDto dto) {
		int res=0;
		//system.out.println("클라우드에서의 사용자 이름 : "+dto.getUsername());
		//system.out.println("클라우드에서의 폴더 이름 : "+dto.getCloudfolder());
		res=sqlSession.insert(namespace+"insertFolder", dto);
		return res;
	}
	
	@Override
	public int photo_muldel(int seq) {
		int res = 0;
		
		//system.out.println("photo_muldel(daoimple)까지 오는지 확인");
		res = sqlSession.delete(namespace+"photo_delete", seq);
		//system.out.println("사진 삭제 res : "+res);
		
		return res;
	}

	@Override
	public int folder_muldel(String cloudfolder) {
		int res = 0;
		
		//system.out.println("folder_muldel(daoimple)까지 오는지 확인");
		//system.out.println("삭제할 폴더 이름 : "+cloudfolder);
		res = sqlSession.delete(namespace+"folder_delete",cloudfolder);
		//system.out.println("폴더 삭제 res : "+res);
		
		return res;
	}

}