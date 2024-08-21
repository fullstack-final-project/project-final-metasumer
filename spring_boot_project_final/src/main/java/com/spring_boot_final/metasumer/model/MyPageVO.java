package com.spring_boot_final.metasumer.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MyPageVO {
	public String myPageCtgId;
	public String myPageCtgName;
	
	// DB에 없지만 mapper에 이용할 변수
	public int recordNo;
	public String memId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date createdDate;
	
	public String uploadImage;
	public String title;
	public String memNickname;
	public String fishName;
	public String fishSize;
	
	// 낚시 성공률
	public String fishNo;
	public String tide;
	public int tideImportance;
	public String location;
	public int locationImportance;
	public String weather;
	public int weatherImportance;
	public String commonValue;
	public int commonScore;
	public String importanceCtgId;
	
	public String getFishNo() {
		return fishNo;
	}
	public void setFishNo(String fishNo) {
		this.fishNo = fishNo;
	}
	public String getTide() {
		return tide;
	}
	public void setTide(String tide) {
		this.tide = tide;
	}
	public int getTideImportance() {
		return tideImportance;
	}
	public void setTideImportance(int tideImportance) {
		this.tideImportance = tideImportance;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getLocationImportance() {
		return locationImportance;
	}
	public void setLocationImportance(int locationImportance) {
		this.locationImportance = locationImportance;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public int getWeatherImportance() {
		return weatherImportance;
	}
	public void setWeatherImportance(int weatherImportance) {
		this.weatherImportance = weatherImportance;
	}
	public String getCommonValue() {
		return commonValue;
	}
	public void setCommonValue(String commonValue) {
		this.commonValue = commonValue;
	}
	public int getCommonScore() {
		return commonScore;
	}
	public void setCommonScore(int commonScore) {
		this.commonScore = commonScore;
	}
	public String getImportanceCtgId() {
		return importanceCtgId;
	}
	public void setImportanceCtgId(String importanceCtgId) {
		this.importanceCtgId = importanceCtgId;
	}
	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public String getFishSize() {
		return fishSize;
	}
	public void setFishSize(String fishSize) {
		this.fishSize = fishSize;
	}
	public int getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}	
	public String getMyPageCtgId() {
		return myPageCtgId;
	}
	public void setMyPageCtgId(String myPageCtgId) {
		this.myPageCtgId = myPageCtgId;
	}
	public String getMyPageCtgName() {
		return myPageCtgName;
	}
	public void setMyPageCtgName(String myPageCtgName) {
		this.myPageCtgName = myPageCtgName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(String uploadImage) {
		this.uploadImage = uploadImage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

}
