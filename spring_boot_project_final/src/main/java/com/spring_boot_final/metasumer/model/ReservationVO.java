package com.spring_boot_final.metasumer.model;

import java.sql.Time;
import java.util.Date;

public class ReservationVO {
  private Integer resNo; // 예약 번호
  private String resType; // 카테고리 (배낚시/낚시터)
  private String memId; // 회원 ID
  private String memName;
  private Integer bizId; // 사업체 ID
  private Date bizDate; // 예약일
  private Time bizStart; // 시작 시간
  private Time bizEnd; // 끝나는 시간
  private Integer resNum; // 예약 인원수
  private Integer bizPrice; // 사업체 가격
  private String bizCoupon; // 사용된 쿠폰
  private String bizResId; // 사업체 예약 ID
  private ReservationStatus resStatus; // Enum 타입으로 예약 상태

  public Integer getResNo() {
    return resNo;
  }




  public void setResNo(Integer resNo) {
    this.resNo = resNo;
  }




  public String getResType() {
    return resType;
  }




  public void setResType(String resType) {
    this.resType = resType;
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




  public Integer getBizId() {
    return bizId;
  }




  public void setBizId(Integer bizId) {
    this.bizId = bizId;
  }




  public Date getBizDate() {
    return bizDate;
  }




  public void setBizDate(Date bizDate) {
    this.bizDate = bizDate;
  }




  public Time getBizStart() {
    return bizStart;
  }




  public void setBizStart(Time bizStart) {
    this.bizStart = bizStart;
  }




  public Time getBizEnd() {
    return bizEnd;
  }




  public void setBizEnd(Time bizEnd) {
    this.bizEnd = bizEnd;
  }




  public Integer getResNum() {
    return resNum;
  }




  public void setResNum(Integer resNum) {
    this.resNum = resNum;
  }




  public Integer getBizPrice() {
    return bizPrice;
  }




  public void setBizPrice(Integer bizPrice) {
    this.bizPrice = bizPrice;
  }




  public String getBizCoupon() {
    return bizCoupon;
  }




  public void setBizCoupon(String bizCoupon) {
    this.bizCoupon = bizCoupon;
  }




  public String getBizResId() {
    return bizResId;
  }




  public void setBizResId(String bizResId) {
    this.bizResId = bizResId;
  }




  public ReservationStatus getResStatus() {
    return resStatus;
  }




  public void setResStatus(ReservationStatus resStatus) {
    this.resStatus = resStatus;
  }




  public enum ReservationStatus {
    pending, // 승인 대기
    confirmed, // 확정
    cancelled // 취소
  }

}
