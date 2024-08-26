package com.spring_boot_final.metasumer.model;

import java.util.List;

public class TagRequestVO {
	private String memId;
    private List<String> tags;
    private List<String> newTags;
    
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public List<String> getNewTags() {
		return newTags;
	}
	public void setNewTags(List<String> newTags) {
		this.newTags = newTags;
	}
    
    

}
