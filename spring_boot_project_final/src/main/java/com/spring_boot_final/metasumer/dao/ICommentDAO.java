package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.CommentVO;

public interface ICommentDAO {

	// 물고기 해당 글 댓글
	public ArrayList<CommentVO> listAllComment(String recordNo);

	// 물고기 댓글 등록
	public void addComment(CommentVO vo);

	// 물고기 댓글 수정
	public void updateComment(CommentVO vo);

	// 물고기 댓글 삭제
	public void deleteComment(String commentNo, String recordNo);

	// 해당 글 댓글
	public ArrayList<CommentVO> listAllCommentBoard(String boardPostNo);

	// 댓글 등록
	public void addCommentBoard(CommentVO vo);

	// 댓글 수정
	public void updateCommentBoard(CommentVO vo);

	// 댓글 삭제
	public void deleteCommentBoard(String commentNo, String boardPostNo);

}
