package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.BusinessVO;

public interface IBusinessService {

  public BusinessVO getBusinessWithCategory(int bizId);
  
  public ArrayList<BusinessVO> getAllBusiness();
  
  public ArrayList<BusinessVO> getBusinessCategory();
  
  public void registerBusiness(BusinessVO vo);
  
  public void updateBusiness(BusinessVO vo);
  
  public void deleteBusiness(int bizId);
}
