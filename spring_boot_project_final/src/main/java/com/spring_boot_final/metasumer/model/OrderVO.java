package com.spring_boot_final.metasumer.model;

import java.util.Date;

public class OrderVO {
  private int orderId;            // 주문 ID (자동 생성)
  private String prdNo;           // 상품 번호
  private int quantity;           // 주문 수량
  private Date orderDate;         // 주문 일자
  private String buyerName;       // 구매자 이름
  private String buyerHP;         // 구매자 휴대전화
  private String buyerEmail;      // 구매자 이메일
  private String shippingZipcode; // 배송지 우편번호
  private String shippingAddress1; // 배송지 주소1
  private String shippingAddress2; // 배송지 주소2
  private int totalPrice; 
  
  private int bizId;              // 사업자 ID
  public int getOrderId() {
    return orderId;
  }
  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }
  public String getPrdNo() {
    return prdNo;
  }
  public void setPrdNo(String prdNo) {
    this.prdNo = prdNo;
  }
  public int getQuantity() {
    return quantity;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  public Date getOrderDate() {
    return orderDate;
  }
  public void setOrderDate(Date orderDate) {
    this.orderDate = orderDate;
  }
  public String getBuyerName() {
    return buyerName;
  }
  public void setBuyerName(String buyerName) {
    this.buyerName = buyerName;
  }
  public String getBuyerHP() {
    return buyerHP;
  }
  public void setBuyerHP(String buyerHP) {
    this.buyerHP = buyerHP;
  }
  public String getBuyerEmail() {
    return buyerEmail;
  }
  public void setBuyerEmail(String buyerEmail) {
    this.buyerEmail = buyerEmail;
  }
  public String getShippingZipcode() {
    return shippingZipcode;
  }
  public void setShippingZipcode(String shippingZipcode) {
    this.shippingZipcode = shippingZipcode;
  }
  public String getShippingAddress1() {
    return shippingAddress1;
  }
  public void setShippingAddress1(String shippingAddress1) {
    this.shippingAddress1 = shippingAddress1;
  }
  public String getShippingAddress2() {
    return shippingAddress2;
  }
  public void setShippingAddress2(String shippingAddress2) {
    this.shippingAddress2 = shippingAddress2;
  }
  public int getBizId() {
    return bizId;
  }
  public int getTotalPrice() {
    return totalPrice;
  }
  public void setTotalPrice(int totalPrice) {
    this.totalPrice = totalPrice;
  }
  public void setBizId(int bizId) {
    this.bizId = bizId;
  }
  
  
}
