package com.mvc.inssa.cloud.biz;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.inssa.CloudController;
import com.mvc.inssa.cloud.dao.CloudDao;
import com.mvc.inssa.cloud.dto.CloudDto;

@Service("cloudBiz")
public class CloudBizImpl implements CloudBiz{
   private static final Logger logger = LoggerFactory.getLogger(CloudController.class);
   
   @Autowired
    private CloudDao dao;

   @Override
   public int insert(CloudDto dto) {
      return dao.insert(dto);
   }

   @Override
   public int nextInsert(CloudDto dto) {
      return dao.nextInsert(dto);
   }

   @Override
   public List<CloudDto> selectList(String username,String cloudfolder) {
      
      return dao.selectList(username,cloudfolder);
   }

	@Override
	public List<CloudDto> selectFolderList(String username) {
		return dao.selectFolderList(username);
	}
	
	@Override
	public int insertFolder(CloudDto dto) {
		return dao.insertFolder(dto);
	}
	
	@Override
	public int photo_muldel(int seq) {
		return dao.photo_muldel(seq);
	}

	@Override
	public int folder_muldel(String cloudfolder) {
		return dao.folder_muldel(cloudfolder);
	}


}