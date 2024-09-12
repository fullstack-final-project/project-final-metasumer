package com.spring_boot_final.metasumer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IOrderDAO;
import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderVO;

@Service
public class OrderService implements IOrderService {

  @Autowired
  @Qualifier("IOrderDAO")
  IOrderDAO dao;
  
  @Override
  public void saveOrder(OrderVO order) {
	// (1) 주문 정보 저장
      dao.saveOrder(order);

    
  }
  
  @Override
  public MemberVO getMemberById(String memId) {
    return dao.getMemberById(memId);
  }
}
