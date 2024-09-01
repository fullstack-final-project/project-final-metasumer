package com.spring_boot_final.metasumer.model;

import java.util.Date;

public class BusinessVO {
  private int bizId; // 비즈니스 ID
  private String memId; // 회원 ID
  private String businessName; // 사업자 이름
  private String authStatus; // 인증 상태 ('pending', 'approved', 'rejected')
  private Date authDate; // 인증 날짜
  private String bizRegNumber; // 사업자 등록 번호
  private String businessType; // 사업 유형 ('sale', 'reservation')
  private String bizRegImg; // 사업자 등록 이미지 URL
  private String delegate; // 대표자 이름
  private String businessAddress; // 사업장 소재지
  private String businessCategory; // 업태
  private String issueDate; // 발행일
  
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
  public String getDelegate() {
    return delegate;
  }
  public void setDelegate(String delegate) {
    this.delegate = delegate;
  }
  public String getBusinessAddress() {
    return businessAddress;
  }
  public void setBusinessAddress(String businessAddress) {
    this.businessAddress = businessAddress;
  }
  public String getBusinessCategory() {
    return businessCategory;
  }
  public void setBusinessCategory(String businessCategory) {
    this.businessCategory = businessCategory;
  }
  public String getIssueDate() {
    return issueDate;
  }
  public void setIssueDate(String issueDate) {
    this.issueDate = issueDate;
  }

  
  

}
