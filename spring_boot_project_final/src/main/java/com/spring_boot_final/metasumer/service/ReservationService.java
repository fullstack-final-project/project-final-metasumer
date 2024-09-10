package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IReservationDAO;
import com.spring_boot_final.metasumer.model.ReservationVO;

@Service
public class ReservationService implements IReservationService {
  @Autowired
  @Qualifier("IReservationDAO")
  IReservationDAO dao;

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
  
  @Override
  public void saveReservation(ReservationVO reservation) {
    dao.saveReservation(reservation);
  }

}
