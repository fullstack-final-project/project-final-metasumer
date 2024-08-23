package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.BusinessVO;

public interface IBusinessDAO {
 
  public ArrayList<BusinessVO> getAllBusiness();
  
  public void registerBusiness(BusinessVO vo);
  
  public void updateBusiness(BusinessVO vo);
  
  public void deleteBusiness(int bizId);
}
