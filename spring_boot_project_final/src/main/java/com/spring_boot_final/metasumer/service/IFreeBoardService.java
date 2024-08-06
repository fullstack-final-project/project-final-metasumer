package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring_boot_final.metasumer.model.FreeBoardVO;

public interface IFreeBoardService {

	// 게시판 글 수
	public int countTotalItems();

	// 게시판 글 목록
	public List<FreeBoardVO> selectItemsForPage(int offset, int limit);

	// 자유게시판 등록
	public void insertFreeBoard(FreeBoardVO vo);

	// 자유게시판 수정
	public void updateFreeBoard(FreeBoardVO vo);

	// 자유게시판 삭제
	public void deleteFreeBoard(String boardPostNo);

	// 자유게시판 상세 보기
	public FreeBoardVO detailViewFreeBoard(String boardPostNo);

	// 자유게시판 검색
	public ArrayList<FreeBoardVO> FreeBoardSearch(HashMap<String, Object> map);

}
