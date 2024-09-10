package com.spring_boot_final.metasumer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.ISalesDAO;
import com.spring_boot_final.metasumer.model.SalesVO;

@Service
public class SalesService implements ISalesService {
  
  @Autowired
  @Qualifier("ISalesDAO")
  ISalesDAO dao;

  @Override
  public void saveSale(SalesVO sale) {
    dao.saveSale(sale);

  }

}
