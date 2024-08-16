package com.spring_boot_final.metasumer.model;

public class BusinessVO {
  private Integer bizId;
  private String bizName;
  private String bizRegNum; // 사업자 번호
  private String bizZipcode;
  private String bizAddress1;
  private String bizAddress2;
  private String bizRegImg; // 사업장 이미지
  private String bizHP1;
  private String bizHP2;
  private String bizHP3;
  private String memId;
  private Integer bizCtgId;
  private String bizCtgName;
  
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

  public String getBizHP1() {
    return bizHP1;
  }

  public void setBizHP1(String bizHP1) {
    this.bizHP1 = bizHP1;
  }

  public String getBizHP2() {
    return bizHP2;
  }

  public void setBizHP2(String bizHP2) {
    this.bizHP2 = bizHP2;
  }

  public String getBizHP3() {
    return bizHP3;
  }

  public void setBizHP3(String bizHP3) {
    this.bizHP3 = bizHP3;
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
  
  public String getBizCtgName() {
    return bizCtgName;
  }

  public void setBizCtgName(String bizCtgName) {
    this.bizCtgName = bizCtgName;
  }



}
