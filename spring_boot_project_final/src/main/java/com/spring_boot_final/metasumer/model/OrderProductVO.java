package com.spring_boot_final.metasumer.model;

public class OrderProductVO {
	private String ordNo;
	private String prdNo;
	private int ordQty;
	
	// DB 테이블에는 없지만
	// Mapper에서 받아서 뷰 페이지에 출력할 때 필요한 필드 추가
	private String memId;
	private String prdName;
	private String prdPrice;
	private String prdImage;

	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	public int getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public String getPrdPrice() {
		return prdPrice;
	}
	public void setPrdPrice(String prdPrice) {
		this.prdPrice = prdPrice;
	}
	public String getPrdImage() {
		return prdImage;
	}
	public void setPrdImage(String prdImage) {
		this.prdImage = prdImage;
	}

}
