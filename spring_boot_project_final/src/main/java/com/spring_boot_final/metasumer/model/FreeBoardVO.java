package com.spring_boot_final.metasumer.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FreeBoardVO {
	
	private String boardPostNo;
	private String memId;
	private int boardCtgId;
	private String title;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	
	private String content;
	private String uploadFile;
	private String memNickname;
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

	
}