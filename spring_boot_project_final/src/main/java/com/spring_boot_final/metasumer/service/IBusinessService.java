package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.List;

import com.spring_boot_final.metasumer.model.BusinessVO;

public interface IBusinessService {
  
  public ArrayList<BusinessVO> getAllBusiness();
 
  public void registerBusiness(BusinessVO vo);
  
  public void updateBusiness(BusinessVO vo);
  
  public void deleteBusiness(int bizId);
  
  // 사업자 회원 정보 조회
  public BusinessVO getBusinessByMemId(String memId);
  
  //특정 memId에 대한 모든 사업체를 조회
  public List<BusinessVO> getBusinessesByMemId(String memId);
  
  public BusinessVO getBusinessByBizId(int bizId);
}
