package com.spring_boot_final.metasumer.model;

import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReservationListVO {
	private int resNo;     // 예약 번호
	private String memId; // 회원 ID
	private String memName; // 회원 이름
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date resDate; // 예약 날짜
	
	private Time resStart; // 예약 시작 시간
	private Time resEnd; // 예약 종료 시간
	private int resNum; // 예약 인원 수
	private int resPrice; // 예약 금액
	private int spotId; // 낚시터 ID
	
	// DB 테이블에는 없지만
	// Mapper에서 받아서 뷰 페이지에 출력할 때 필요한 필드 추가
	private String spotName;
	private String spotDescription;
	private String spotImage;
	private String spotAddress1;
	private String spotAddress2;
	private String spotHP1;
	private String spotHP2;
	private String spotHP3;
	
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	public String getResStart() {
		LocalTime startTime = resStart.toLocalTime();
        return startTime.format(DateTimeFormatter.ofPattern("HH:mm"));
	}
	public void setResStart(Time resStart) {
		this.resStart = resStart;
	}
	public String getResEnd() {
		LocalTime endTime = resEnd.toLocalTime();
        return endTime.format(DateTimeFormatter.ofPattern("HH:mm"));
	}
	public void setResEnd(Time resEnd) {
		this.resEnd = resEnd;
	}
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
	public int getResPrice() {
		return resPrice;
	}
	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}
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
	public String getSpotDescription() {
		return spotDescription;
	}
	public void setSpotDescription(String spotDescription) {
		this.spotDescription = spotDescription;
	}
	public String getSpotImage() {
		return spotImage;
	}
	public void setSpotImage(String spotImage) {
		this.spotImage = spotImage;
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

}
