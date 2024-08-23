package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IBusinessDAO;
import com.spring_boot_final.metasumer.model.BusinessVO;

@Service
public class BusinessService implements IBusinessService {
  
  @Autowired
  @Qualifier("IBusinessDAO")
  IBusinessDAO dao;

  @Override
  public ArrayList<BusinessVO> getAllBusiness() {
    return dao.getAllBusiness();
  }

  @Override
  public void registerBusiness(BusinessVO vo) {
    dao.registerBusiness(vo);
  }

  @Override
  public void updateBusiness(BusinessVO vo) {
    dao.updateBusiness(vo);
  }

  @Override
  public void deleteBusiness(int bizId) {
    dao.deleteBusiness(bizId);
  }

}
