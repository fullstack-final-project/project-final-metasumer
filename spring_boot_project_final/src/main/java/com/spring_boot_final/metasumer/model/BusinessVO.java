package com.spring_boot_final.metasumer.model;

public class BusinessVO {
  private Integer bizId;
  private String bizName;
  private String bizRegNum; // 사업자 번호
  private String bizZipcode;
  private String bizAddress1;
  private String bizAddress2;
  private String bizRegImg; // 사업장 이미지
  private String bizHp1;
  private String bizHp2;
  private String bizHp3;
  private String memId;
  private Integer bizCtgId;

  private BusinessEnums.MemType memType; // Enum 타입으로 설정(일반/사업자)

  public Integer getBizId() {
    return bizId;
  }

  public void setBizId(Integer bizId) {
    this.bizId = bizId;
  }

  public String getBizName() {
    return bizName;
  }

  public void setBizName(String bizName) {
    this.bizName = bizName;
  }

  public String getBizRegNum() {
    return bizRegNum;
  }

  public void setBizRegNum(String bizRegNum) {
    this.bizRegNum = bizRegNum;
  }

  public String getBizZipcode() {
    return bizZipcode;
  }

  public void setBizZipcode(String bizZipcode) {
    this.bizZipcode = bizZipcode;
  }

  public String getBizAddress1() {
    return bizAddress1;
  }

  public void setBizAddress1(String bizAddress1) {
    this.bizAddress1 = bizAddress1;
  }

  public String getBizAddress2() {
    return bizAddress2;
  }

  public void setBizAddress2(String bizAddress2) {
    this.bizAddress2 = bizAddress2;
  }

  public String getBizRegImg() {
    return bizRegImg;
  }

  public void setBizRegImg(String bizRegImg) {
    this.bizRegImg = bizRegImg;
  }

  public String getBizHp1() {
    return bizHp1;
  }

  public void setBizHp1(String bizHp1) {
    this.bizHp1 = bizHp1;
  }

  public String getBizHp2() {
    return bizHp2;
  }

  public void setBizHp2(String bizHp2) {
    this.bizHp2 = bizHp2;
  }

  public String getBizHp3() {
    return bizHp3;
  }

  public void setBizHp3(String bizHp3) {
    this.bizHp3 = bizHp3;
  }
  

  public String getMemId() {
    return memId;
  }

  public void setMemId(String memId) {
    this.memId = memId;
  }

  public Integer getBizCtgId() {
    return bizCtgId;
  }

  public void setBizCtgId(Integer bizCtgId) {
    this.bizCtgId = bizCtgId;
  }

  public BusinessEnums.MemType getMemType() {
    return memType;
  }

  public void setMemType(BusinessEnums.MemType memType) {
    this.memType = memType;
  }


  ///////////////////////////////////////////////////////////////////

  // enum 설정
  public static class BusinessEnums {
    public enum MemType {
      general, business
    }
  }

}
