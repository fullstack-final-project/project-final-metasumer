package com.spring_boot_final.metasumer.dao;

import com.spring_boot_final.metasumer.model.OrderVO;

public interface IOrderDAO {
  
  public void saveOrder(OrderVO order);
  
}
