package com.mvc.inssa.cloud.dao;

import java.util.List;

import com.mvc.inssa.cloud.dto.CloudDto;

public interface CloudDao {

   String namespace = "cloud.";
   
   public int insert(CloudDto dto);
   public int nextInsert(CloudDto dto);
   public int insertFolder(CloudDto dto);
   public List<CloudDto> selectList(String username,String cloudfolder);
   public List<CloudDto> selectFolderList(String username);
   
   public int photo_muldel(int seq);
   public int folder_muldel(String cloudfolder);
}