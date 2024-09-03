package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_final.metasumer.model.FreeBoardVO;

public interface IFreeBoardService {

	// 게시판 글 수
	public int countTotalItems(String boardCtgId);

	// 게시판 글 목록
	public ArrayList<FreeBoardVO> selectItemsForPage(int offset, int limit, String boardCtgId);

	// 벼룩시장 글 목록
	public ArrayList<FreeBoardVO> fleamarketList(String boardCtgId, int completed);

	// 자유게시판 등록
	public void insertFreeBoard(FreeBoardVO vo);

	// 자유게시판 수정
	public void updateFreeBoard(FreeBoardVO vo);

	// 자유게시판 삭제
	public void deleteFreeBoardComment(String boardPostNo);

	public void deleteFreeBoard(String boardPostNo);

	// 자유게시판 상세 보기
	public FreeBoardVO detailViewFreeBoard(String boardPostNo);

	// 자유게시판 검색
	public ArrayList<FreeBoardVO> FreeBoardSearch(HashMap<String, Object> map);

	// QnA
	public ArrayList<FreeBoardVO> qnaList(String boardCtgId);

	// 벼룩시장 거래 완료
	public void fleamarketcompleted(String boardPostNo, int completed);

	// 조회수
	public void countViews(String sidmemId, String boardPostNo);

}
