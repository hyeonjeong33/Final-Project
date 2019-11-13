package com.mvc.inssa.cloud.biz;

import java.util.List;

import com.mvc.inssa.cloud.dto.CloudDto;

public interface CloudBiz {
   public List<CloudDto> selectList(String username,String cloudfolder);
   public List<CloudDto> selectFolderList(String username);
  
   public int insert(CloudDto dto);
   public int insertFolder(CloudDto dto);
   public int nextInsert(CloudDto dto);
   
   public int photo_muldel(int seq);
   public int folder_muldel(String cloudfolder);
   
}