package com.spring_boot_final.metasumer.model;

public class ProductVO {
  private String prdNo; // 제품 번호
  private String prdName; // 제품 이름
  private Integer prdPrice; // 가격
  private Integer prdStock; // 재고
  private String prdMaker; // 제조사
  private String prdDescript; // 설명
  private String prdImage; // 이미지 URL
  private Integer bizId; // 사업체 ID
  private Integer prdCtgId;
  private String prdCtgName;

  public String getPrdNo() {
    return prdNo;
  }

  public void setPrdNo(String prdNo) {
    this.prdNo = prdNo;
  }

  public String getPrdName() {
    return prdName;
  }

  public void setPrdName(String prdName) {
    this.prdName = prdName;
  }

  public Integer getPrdPrice() {
    return prdPrice;
  }

  public void setPrdPrice(Integer prdPrice) {
    this.prdPrice = prdPrice;
  }

  public Integer getPrdStock() {
    return prdStock;
  }

  public void setPrdStock(Integer prdStock) {
    this.prdStock = prdStock;
  }

  public String getPrdMaker() {
    return prdMaker;
  }

  public void setPrdMaker(String prdMaker) {
    this.prdMaker = prdMaker;
  }

  public String getPrdDescript() {
    return prdDescript;
  }

  public void setPrdDescript(String prdDescript) {
    this.prdDescript = prdDescript;
  }

  public String getPrdImage() {
    return prdImage;
  }

  public void setPrdImage(String prdImage) {
    this.prdImage = prdImage;
  }

  public Integer getBizId() {
    return bizId;
  }

  public void setBizId(Integer bizId) {
    this.bizId = bizId;
  }

  public Integer getPrdCtgId() {
    return prdCtgId;
  }

  public void setPrdCtgId(Integer prdCtgId) {
    this.prdCtgId = prdCtgId;
  }

  public String getPrdCtgName() {
    return prdCtgName;
  }

  public void setPrdCtgName(String prdCtgName) {
    this.prdCtgName = prdCtgName;
  }
  
  
  
  

}
