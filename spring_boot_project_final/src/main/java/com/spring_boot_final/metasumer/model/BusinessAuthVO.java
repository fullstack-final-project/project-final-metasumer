package com.spring_boot_final.metasumer.model;

import java.util.Date;

public class BusinessAuthVO {
	
	private String memId;
	private String businessName;
	private String bizRegNumber;
	private String businessType;
	private String delegate;
	private String businessAddress;
	private String businessCategory;
	private String issueDate;
	private String bizRegImg;
	private String authStatus;
	private Date authDate;
	
	
	public Date getAuthDate() {
		return authDate;
	}
	public void setAuthDate(Date authDate) {
		this.authDate = authDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBizRegNumber() {
		return bizRegNumber;
	}
	public void setBizRegNumber(String bizRegNumber) {
		this.bizRegNumber = bizRegNumber;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getDelegate() {
		return delegate;
	}
	public void setDelegate(String delegate) {
		this.delegate = delegate;
	}
	public String getBusinessAddress() {
		return businessAddress;
	}
	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}
	public String getBusinessCategory() {
		return businessCategory;
	}
	public void setBusinessCategory(String businessCategory) {
		this.businessCategory = businessCategory;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getBizRegImg() {
		return bizRegImg;
	}
	public void setBizRegImg(String bizRegImg) {
		this.bizRegImg = bizRegImg;
	}
	public String getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}
	

}
