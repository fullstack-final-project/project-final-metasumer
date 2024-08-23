package com.spring_boot_final.metasumer.model;

import java.util.Date;

public class BusinessVO {
  private int bizId;                // 인증 ID
  private String memId;              // 회원 ID
  private String businessName;       // 사업체 이름
  private String authStatus;         // 인증 상태
  private Date authDate;             // 인증 날짜
  private String authDetails;        // 사업자 설명란
  private String bizRegNumber;       // 사업자 등록 번호
  private String businessType;       // 사업자 유형
  private String bizRegImg;          // 사업자 등록증 이미지 경로
  public int getBizId() {
    return bizId;
  }
  public void setBizId(int bizId) {
    this.bizId = bizId;
  }
  public String getMemId() {
    return memId;
  }
  public void setMemId(String memId) {
    this.memId = memId;
  }
  public String getBusinessName() {
    return businessName;
  }
  public void setBusinessName(String businessName) {
    this.businessName = businessName;
  }
  public String getAuthStatus() {
    return authStatus;
  }
  public void setAuthStatus(String authStatus) {
    this.authStatus = authStatus;
  }
  public Date getAuthDate() {
    return authDate;
  }
  public void setAuthDate(Date authDate) {
    this.authDate = authDate;
  }
  public String getAuthDetails() {
    return authDetails;
  }
  public void setAuthDetails(String authDetails) {
    this.authDetails = authDetails;
  }
  public String getBizRegNumber() {
    return bizRegNumber;
  }
  public void setBizRegNumber(String bizRegNumber) {
    this.bizRegNumber = bizRegNumber;
  }
  public String getBusinessType() {
    return businessType;
  }
  public void setBusinessType(String businessType) {
    this.businessType = businessType;
  }
  public String getBizRegImg() {
    return bizRegImg;
  }
  public void setBizRegImg(String bizRegImg) {
    this.bizRegImg = bizRegImg;
  }
  
  

}
