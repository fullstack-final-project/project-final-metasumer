package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.ReservationVO;

public interface IReservationService {
  
  // 일반회원
  public ArrayList<ReservationVO> getAllReservations();

  // 사업자 카테고리별 예약 정보 불러오기
  public ArrayList<ReservationVO> listReservationByCategory(Integer bizCtgId);
  
  // 확정
  public int confirmReservation(Integer resNo, Integer bizCtgId);
  
  // 취소
  public int cancelReservation(Integer resNo, Integer bizCtgId);
}
