package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.ICommentDAO;
import com.spring_boot_final.metasumer.model.CommentVO;

@Service
public class CommentService implements ICommentService {
	
	@Autowired
	@Qualifier("ICommentDAO")
	ICommentDAO dao;

	@Override
	public ArrayList<CommentVO> listAllComment(String recordNo) {
		return dao.listAllComment(recordNo);
	}

	@Override
	public void addComment(CommentVO vo) {
		dao.addComment(vo);
	}

	@Override
	public void updateComment(CommentVO vo) {
		dao.updateComment(vo);
	}

	@Override
	public void deleteComment(String commentNo, String recordNo) {
		dao.deleteComment(commentNo, recordNo);
	}

	@Override
	public ArrayList<CommentVO> listAllCommentBoard(String boardPostNo) {
		return dao.listAllCommentBoard(boardPostNo);
	}

	@Override
	public void addCommentBoard(CommentVO vo) {
		dao.addCommentBoard(vo);
	}

	@Override
	public void updateCommentBoard(CommentVO vo) {
		dao.updateCommentBoard(vo);
	}

	@Override
	public void deleteCommentBoard(String commentNo, String boardPostNo) {
		dao.deleteCommentBoard(commentNo, boardPostNo);
	}

}
