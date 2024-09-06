package com.spring_boot_final.metasumer.dao;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderVO;

public interface IOrderDAO {
  
  public void saveOrder(OrderVO order);
  
  //회원정보 조회
  public MemberVO getMemberById(String memId);
  
}
