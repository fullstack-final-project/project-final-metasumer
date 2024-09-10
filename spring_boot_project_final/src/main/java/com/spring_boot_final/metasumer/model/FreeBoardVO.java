package com.spring_boot_final.metasumer.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FreeBoardVO {
	
	private String boardPostNo;
	private String memId;
	private int boardCtgId;
	private String boardCtgName;
	
	
	private String title;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	
	private String content;
	private String uploadFile;
	private String memNickname;
	private String price;
	private int completed;
	
	private int postId;
	private int views;
	private String status;
	
	
	
	
	
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getCompleted() {
		return completed;
	}
	public void setCompleted(int completed) {
		this.completed = completed;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBoardPostNo() {
		return boardPostNo;
	}
	public void setBoardPostNo(String boardPostNo) {
		this.boardPostNo = boardPostNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
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
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public String getBoardCtgName() {
		return boardCtgName;
	}
	public void setBoardCtgName(String boardCtgName) {
		this.boardCtgName = boardCtgName;
	}
	
	
	
}