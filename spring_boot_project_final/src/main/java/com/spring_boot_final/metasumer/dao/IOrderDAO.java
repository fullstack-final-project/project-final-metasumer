package com.spring_boot_final.metasumer.dao;

import java.util.List;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderVO;
import com.spring_boot_final.metasumer.model.ProductVO;

public interface IOrderDAO {
  
  public void saveOrder(OrderVO order);
  
  //회원정보 조회
  public MemberVO getMemberById(String memId);
  
  public void updateProductStock(ProductVO product);
  
  public List<OrderVO> findAllOrders(int bizId);
  
}
