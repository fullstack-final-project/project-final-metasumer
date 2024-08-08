package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IBusinessDAO;
import com.spring_boot_final.metasumer.model.ReservationVO;

@Service
public class BusinessService implements IBusinessService {
  //DI 설정
  // MyBatis인 경우에는 @Autowired만 사용하지 않고 @Quarlifier와 같이 사용
  @Autowired
  @Qualifier("IBusinessDAO")
  IBusinessDAO dao;

  @Override
  public ArrayList<ReservationVO> getAllReservations() {
    return dao.getAllReservations();
  }

  @Override
  public int confirmReservation(Integer resNo) {
    return dao.confirmReservation(resNo);
  }

  @Override
  public int cancelReservation(Integer resNo) {
    return dao.cancelReservation(resNo);
  }

}
