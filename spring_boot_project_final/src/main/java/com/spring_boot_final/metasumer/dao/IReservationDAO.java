package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_final.metasumer.model.ReservationVO;

public interface IReservationDAO {
 
 // 일반회원
 public ArrayList<ReservationVO> getAllReservations();
 
 // 사업자
 public ArrayList<ReservationVO> listReservationByCategory(Integer bizCtgId);
  
 public int confirmReservation(@Param("resNo") int resNo, @Param("bizCtgId") int bizCtgId);
 
 public int cancelReservation(@Param("resNo") int resNo, @Param("bizCtgId") int bizCtgId);
 
}
