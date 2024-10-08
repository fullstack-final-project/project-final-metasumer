package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.ReservationVO;

public interface IReservationService {
  
  // 일반회원
  public ArrayList<ReservationVO> getAllReservations();
  
  // 사업자별 예약 내역 불러오기
  public ArrayList<ReservationVO> getReservationsByBusiness(int bizId);
  
  // 확정
  public int confirmReservation(Integer resNo);
  
  // 취소
  public int cancelReservation(Integer resNo);
  
  // 저장
  public void saveReservation(ReservationVO reservation);
}
