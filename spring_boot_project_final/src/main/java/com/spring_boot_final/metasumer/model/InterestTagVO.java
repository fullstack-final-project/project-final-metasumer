package com.spring_boot_final.metasumer.model;

public class InterestTagVO {
	
	private int interestId;
    private String tagImage;
    private String categoryName;
    private int memberCount;
    
    
    
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getInterestId() {
		return interestId;
	}
	public void setInterestId(int interestId) {
		this.interestId = interestId;
	}
	public String getTagImage() {
		return tagImage;
	}
	public void setTagImage(String tagImage) {
		this.tagImage = tagImage;
	}
	public int getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
    
    
    
    
}
