package com.spring_boot_final.metasumer.model;

import java.util.Date;

public class SalesVO {
  private int saleId;
  private String prdNo;
  private Date saleDate;
  private int saleQuantity;
  private int salePrice;
  private int bizId;
  
  public int getSaleId() {
    return saleId;
  }
  public void setSaleId(int saleId) {
    this.saleId = saleId;
  }
  public String getPrdNo() {
    return prdNo;
  }
  public void setPrdNo(String prdNo) {
    this.prdNo = prdNo;
  }
  public Date getSaleDate() {
    return saleDate;
  }
  public void setSaleDate(Date saleDate) {
    this.saleDate = saleDate;
  }
  public int getSaleQuantity() {
    return saleQuantity;
  }
  public void setSaleQuantity(int saleQuantity) {
    this.saleQuantity = saleQuantity;
  }
  public int getSalePrice() {
    return salePrice;
  }
  public void setSalePrice(int salePrice) {
    this.salePrice = salePrice;
  }
  public int getBizId() {
    return bizId;
  }
  public void setBizId(int bizId) {
    this.bizId = bizId;
  }
  
  
  
  
}
