package com.spring_boot_final.metasumer.model;

import java.sql.Time;

public class FishingSpotVO {
  private int spotId;
  private String spotName;
  private String spotType;
  private String spotDescription;
  private int spotPrice;
  private String spotImage;
  private Time openingTime;
  private Time closingTime;
  private String spotZipcode;
  private String spotAddress1;
  private String spotAddress2;
  private String spotHP1;
  private String spotHP2;
  private String spotHP3;
  private String spotFacility;
  private int bizId;

  public int getSpotId() {
    return spotId;
  }

  public void setSpotId(int spotId) {
    this.spotId = spotId;
  }

  public String getSpotName() {
    return spotName;
  }

  public void setSpotName(String spotName) {
    this.spotName = spotName;
  }

  public String getSpotType() {
    return spotType;
  }

  public void setSpotType(String spotType) {
    this.spotType = spotType;
  }

  public String getSpotDescription() {
    return spotDescription;
  }

  public void setSpotDescription(String spotDescription) {
    this.spotDescription = spotDescription;
  }

  public int getSpotPrice() {
    return spotPrice;
  }

  public void setSpotPrice(int spotPrice) {
    this.spotPrice = spotPrice;
  }

  public String getSpotImage() {
    return spotImage;
  }

  public void setSpotImage(String spotImage) {
    this.spotImage = spotImage;
  }

  public Time getOpeningTime() {
    return openingTime;
  }

  public void setOpeningTime(Time openingTime) {
    this.openingTime = openingTime;
  }

  public Time getClosingTime() {
    return closingTime;
  }

  public void setClosingTime(Time closingTime) {
    this.closingTime = closingTime;
  }

  public String getSpotZipcode() {
    return spotZipcode;
  }

  public void setSpotZipcode(String spotZipcode) {
    this.spotZipcode = spotZipcode;
  }

  public String getSpotAddress1() {
    return spotAddress1;
  }

  public void setSpotAddress1(String spotAddress1) {
    this.spotAddress1 = spotAddress1;
  }

  public String getSpotAddress2() {
    return spotAddress2;
  }

  public void setSpotAddress2(String spotAddress2) {
    this.spotAddress2 = spotAddress2;
  }

  public String getSpotHP1() {
    return spotHP1;
  }

  public void setSpotHP1(String spotHP1) {
    this.spotHP1 = spotHP1;
  }

  public String getSpotHP2() {
    return spotHP2;
  }

  public void setSpotHP2(String spotHP2) {
    this.spotHP2 = spotHP2;
  }

  public String getSpotHP3() {
    return spotHP3;
  }

  public void setSpotHP3(String spotHP3) {
    this.spotHP3 = spotHP3;
  }

  public String getSpotFacility() {
    return spotFacility;
  }

  public void setSpotFacility(String spotFacility) {
    this.spotFacility = spotFacility;
  }

  public int getBizId() {
    return bizId;
  }

  public void setBizId(int bizId) {
    this.bizId = bizId;
  }

}
