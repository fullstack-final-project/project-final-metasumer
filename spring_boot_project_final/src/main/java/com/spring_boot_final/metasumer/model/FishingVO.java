package com.spring_boot_final.metasumer.model;

public class FishingVO {
	public String fishingNo;
	public String fishingDescription;
	public String fishingImg;
	public String fishingCtgId;
	public String fishingDetailCtgId;
	public String fishingDetailCtgName;
	
	// mapper 호출용
	public String fishingCtgName;
	
	public String getFishingCtgName() {
		return fishingCtgName;
	}
	public void setFishingCtgName(String fishingCtgName) {
		this.fishingCtgName = fishingCtgName;
	}
	public String getFishingDetailCtgName() {
		return fishingDetailCtgName;
	}
	public void setFishingDetailCtgName(String fishingDetailCtgName) {
		this.fishingDetailCtgName = fishingDetailCtgName;
	}
	public String getFishingNo() {
		return fishingNo;
	}
	public void setFishingNo(String fishingNo) {
		this.fishingNo = fishingNo;
	}
	public String getFishingDescription() {
		return fishingDescription;
	}
	public void setFishingDescription(String fishingDescription) {
		this.fishingDescription = fishingDescription;
	}
	public String getFishingImg() {
		return fishingImg;
	}
	public void setFishingImg(String fishingImg) {
		this.fishingImg = fishingImg;
	}
	public String getFishingCtgId() {
		return fishingCtgId;
	}
	public void setFishingCtgId(String fishingCtgId) {
		this.fishingCtgId = fishingCtgId;
	}
	public String getFishingDetailCtgId() {
		return fishingDetailCtgId;
	}
	public void setFishingDetailCtgId(String fishingDetailCtgId) {
		this.fishingDetailCtgId = fishingDetailCtgId;
	}

}
