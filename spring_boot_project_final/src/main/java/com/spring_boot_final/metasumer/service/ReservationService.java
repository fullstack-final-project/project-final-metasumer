package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IReservationDAO;
import com.spring_boot_final.metasumer.model.ReservationVO;

@Service
public class ReservationService implements IReservationService {
  //DI 설정
  // MyBatis인 경우에는 @Autowired만 사용하지 않고 @Quarlifier와 같이 사용
  @Autowired
  @Qualifier("IReservationDAO")
  IReservationDAO dao;

  @Override
  public ArrayList<ReservationVO> getAllReservations() {
    return dao.getAllReservations();
  }
  
  @Override
  public ArrayList<ReservationVO> listReservationByCategory(Integer bizCtgId) {
    return dao.listReservationByCategory(bizCtgId);
  }

  @Override
  public int confirmReservation(Integer resNo, Integer bizCtgId) {
    return dao.confirmReservation(resNo, bizCtgId);
  }

  @Override
  public int cancelReservation(Integer resNo, Integer bizCtgId) {
    return dao.cancelReservation(resNo, bizCtgId);
  }

}
