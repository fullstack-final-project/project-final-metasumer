package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IFreeBoardDAO;
import com.spring_boot_final.metasumer.model.FreeBoardVO;

@Service
public class FreeBoardService implements IFreeBoardService {
	
	@Autowired
	@Qualifier("IFreeBoardDAO")
	IFreeBoardDAO dao;
	
	@Override
	public int countTotalItems(String boardCtgId) {
		return dao.countTotalItems(boardCtgId);
	}
	
	@Override
	public ArrayList<FreeBoardVO> selectItemsForPage(int offset, int limit, String boardCtgId) {
		return dao.selectItemsForPage(offset, limit, boardCtgId);
	}
	

	@Override
	public void insertFreeBoard(FreeBoardVO vo) {
		dao.insertFreeBoard(vo);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO vo) {
		dao.updateFreeBoard(vo);
	}

	@Override
	public void deleteFreeBoard(String boardPostNo) {
		dao.deleteFreeBoard(boardPostNo);

	}

	@Override
	public FreeBoardVO detailViewFreeBoard(String boardPostNo) {
		return dao.detailViewFreeBoard(boardPostNo);
	}

	@Override
	public ArrayList<FreeBoardVO> FreeBoardSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<FreeBoardVO> fleamarketList(String boardCtgId, int completed) {
		return dao.fleamarketList(boardCtgId, completed);
	}

	@Override
	public ArrayList<FreeBoardVO> qnaList(String boardCtgId) {
		return dao.qnaList(boardCtgId);
	}
	
	@Override
	public void deleteFreeBoardComment(String boardPostNo) {
		dao.deleteFreeBoardComment(boardPostNo);
	}

	@Override
	public void fleamarketcompleted(String boardPostNo, int completed) {
		dao.fleamarketcompleted(boardPostNo, completed);

	}

	@Override
	public void countViews(String sidmemId, String boardPostNo) {
		dao.countViews(sidmemId, boardPostNo);
	}

}
