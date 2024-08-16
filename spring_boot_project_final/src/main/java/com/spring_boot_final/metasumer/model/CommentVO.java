package com.spring_boot_final.metasumer.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentVO {

	private String commentNo;
	private String memId;
	private String boardCtgId;
	private String recordNo;
	private String boardPostNo;
	private int secret;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;

	private String content;
	private String memNickname;
	
	
	
	

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getBoardPostNo() {
		return boardPostNo;
	}

	public void setBoardPostNo(String boardPostNo) {
		this.boardPostNo = boardPostNo;
	}

	public String getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBoardCtgId() {
		return boardCtgId;
	}

	public void setBoardCtgId(String boardCtgId) {
		this.boardCtgId = boardCtgId;
	}

	public String getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(String recordNo) {
		this.recordNo = recordNo;
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

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

}
