package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.ReservationVO;

public interface IBusinessService {
  // 모든 예약 정보 불러오기
  public ArrayList<ReservationVO> getAllReservations();
  
  // 확정
  public int confirmReservation(Integer resNo);
  
  // 취소
  public int cancelReservation(Integer resNo);
}
