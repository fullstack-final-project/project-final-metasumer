package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public int countTotalItems() {
		return dao.countTotalItems();
	}
	
	@Override
	public List<FreeBoardVO> selectItemsForPage(int offset, int limit) {
		return dao.selectItemsForPage(offset, limit);
	}
	

	@Override
	public void insertFreeBoard(FreeBoardVO vo) {
		dao.insertFreeBoard(vo);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFreeBoard(String boardPostNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public FreeBoardVO detailViewFreeBoard(String boardPostNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<FreeBoardVO> FreeBoardSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
