package com.spring_boot_final.metasumer.service;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderVO;

public interface IOrderService {
  
  public void saveOrder(OrderVO order);
  
  //회원정보 조회
  public MemberVO getMemberById(String memId);
  
}
