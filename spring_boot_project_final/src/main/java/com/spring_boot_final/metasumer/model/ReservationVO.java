package com.spring_boot_final.metasumer.model;

import java.sql.Time;
import java.util.Date;

public class ReservationVO {
  private int resNo;            // 예약 번호
  private String memId;         // 회원 ID
  private String memName;       // 회원 이름
  private int areaId;           // 낚시자리 ID
  private Date resDate;         // 예약 날짜
  private Time resStart;      // 예약 시작 시간
  private Time resEnd;        // 예약 종료 시간
  private int resNum;           // 예약 인원
  private int resPrice;         // 예약 금액
  private String resCoupon;     // 쿠폰 코드
  private String resStatus;     // 예약 상태
  private int bizId;            // 사업자 ID
  private int spotId;           // 낚시터 ID
  private int resQuantity;      // 예약 수량
  
  public int getResNo() {
    return resNo;
  }
  public void setResNo(int resNo) {
    this.resNo = resNo;
  }
  public String getMemId() {
    return memId;
  }
  public void setMemId(String memId) {
    this.memId = memId;
  }
  public String getMemName() {
    return memName;
  }
  public void setMemName(String memName) {
    this.memName = memName;
  }
  public int getAreaId() {
    return areaId;
  }
  public void setAreaId(int areaId) {
    this.areaId = areaId;
  }
  public Date getResDate() {
    return resDate;
  }
  public void setResDate(Date resDate) {
    this.resDate = resDate;
  }
  public Time getResStart() {
    return resStart;
  }
  public void setResStart(Time resStart) {
    this.resStart = resStart;
  }
  public Time getResEnd() {
    return resEnd;
  }
  public void setResEnd(Time resEnd) {
    this.resEnd = resEnd;
  }
  public int getResNum() {
    return resNum;
  }
  public void setResNum(int resNum) {
    this.resNum = resNum;
  }
  public int getResPrice() {
    return resPrice;
  }
  public void setResPrice(int resPrice) {
    this.resPrice = resPrice;
  }
  public String getResCoupon() {
    return resCoupon;
  }
  public void setResCoupon(String resCoupon) {
    this.resCoupon = resCoupon;
  }
  public String getResStatus() {
    return resStatus;
  }
  public void setResStatus(String resStatus) {
    this.resStatus = resStatus;
  }
  public int getBizId() {
    return bizId;
  }
  public void setBizId(int bizId) {
    this.bizId = bizId;
  }
  public int getSpotId() {
    return spotId;
  }
  public void setSpotId(int spotId) {
    this.spotId = spotId;
  }
  public int getResQuantity() {
    return resQuantity;
  }
  public void setResQuantity(int resQuantity) {
    this.resQuantity = resQuantity;
  }
  
  
  
  
  
  
}