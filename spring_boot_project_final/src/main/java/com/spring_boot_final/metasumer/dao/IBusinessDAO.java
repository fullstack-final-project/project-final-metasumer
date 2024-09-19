package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring_boot_final.metasumer.model.BusinessVO;

public interface IBusinessDAO {
 
  public ArrayList<BusinessVO> getAllBusiness();
  
  public void registerBusiness(BusinessVO vo);
  
  public void updateBusiness(BusinessVO vo);
  
  public void deleteBusiness(int bizId);
  
  public BusinessVO getBusinessByMemId(String memId);
  
  //특정 memId에 대한 모든 사업체를 조회
  public List<BusinessVO> getBusinessesByMemId(String memId);
  
  public BusinessVO getBusinessByBizId(int bizId);
}
