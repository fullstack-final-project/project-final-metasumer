package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_final.metasumer.model.ReservationVO;

public interface IBusinessDAO {
  
 public ArrayList<ReservationVO> getAllReservations();
  
 public int confirmReservation(@Param("resNo") int resNo);
 
 public int cancelReservation(@Param("resNo") int resNo);
 
}
