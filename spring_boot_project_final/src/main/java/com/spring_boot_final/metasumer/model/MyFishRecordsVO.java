package com.spring_boot_final.metasumer.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MyFishRecordsVO {
	private String recordNo;
	private String memId;
	private String memNickname;
	private int boardCtgId;
	private String title;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;

	private String content;
	private String uploadImage;
	private String fishName;
	private String fishSize;
	private String equipment; // 장비
	private String location; // 위치
	private String weather; // 날씨
	private String tag;
	
	private int views;
	
	
	

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(String recordNo) {
		this.recordNo = recordNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public int getBoardCtgId() {
		return boardCtgId;
	}

	public void setBoardCtgId(int boardCtgId) {
		this.boardCtgId = boardCtgId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(String uploadImage) {
		this.uploadImage = uploadImage;
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

	public String getEquipment() {
		return equipment;
	}

	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

}
