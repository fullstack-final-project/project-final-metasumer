package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_final.metasumer.model.ReservationVO;

public interface IReservationDAO {
 
 // 일반회원
 public ArrayList<ReservationVO> getAllReservations();
 
 //사업자별 예약 내역 불러오기
 public ArrayList<ReservationVO> getReservationsByBusiness(int bizId);
 
 public int confirmReservation(@Param("resNo") int resNo);
 
 public int cancelReservation(@Param("resNo") int resNo);
 
 //저장
 public void saveReservation(ReservationVO reservation);
 
 
}
