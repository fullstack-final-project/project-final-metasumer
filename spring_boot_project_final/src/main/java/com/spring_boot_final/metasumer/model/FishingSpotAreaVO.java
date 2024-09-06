package com.spring_boot_final.metasumer.model;

import java.sql.Time;

public class FishingSpotAreaVO {
  private int areaId;        // 낚시자리 ID
  private String areaName;  // 낚시자리 이름
  private int areaPrice;    // 낚시자리 가격
  private int minCapacity;  // 최소 인원
  private int maxCapacity;  // 최대 인원
  private Time startTime; 
  private Time endTime;   
  private String fishType;  // 어종
  private int spotId;       // 낚시터 ID
  
  public int getAreaId() {
    return areaId;
  }
  public void setAreaId(int areaId) {
    this.areaId = areaId;
  }
  public String getAreaName() {
    return areaName;
  }
  public void setAreaName(String areaName) {
    this.areaName = areaName;
  }
  public int getAreaPrice() {
    return areaPrice;
  }
  public void setAreaPrice(int areaPrice) {
    this.areaPrice = areaPrice;
  }
  public int getMinCapacity() {
    return minCapacity;
  }
  public void setMinCapacity(int minCapacity) {
    this.minCapacity = minCapacity;
  }
  public int getMaxCapacity() {
    return maxCapacity;
  }
  public void setMaxCapacity(int maxCapacity) {
    this.maxCapacity = maxCapacity;
  }
  public Time getStartTime() {
    return startTime;
  }
  public void setStartTime(Time startTime) {
    this.startTime = startTime;
  }
  public Time getEndTime() {
    return endTime;
  }
  public void setEndTime(Time endTime) {
    this.endTime = endTime;
  }
  public String getFishType() {
    return fishType;
  }
  public void setFishType(String fishType) {
    this.fishType = fishType;
  }
  public int getSpotId() {
    return spotId;
  }
  public void setSpotId(int spotId) {
    this.spotId = spotId;
  }
  
  
  
  
  
}
