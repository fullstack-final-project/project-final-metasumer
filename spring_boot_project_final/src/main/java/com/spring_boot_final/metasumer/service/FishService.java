package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IFishDAO;
import com.spring_boot_final.metasumer.model.FishVO;

@Service
public class FishService implements IFishService {
	@Autowired
	@Qualifier("IFishDAO")
	IFishDAO dao;
	
	@Override
	public ArrayList<FishVO> listAllFish(int offset, int limit) {
		return dao.listAllFish(offset, limit);
	}

	@Override
	public int getFishCount() {
		return dao.getFishCount();
	}

	@Override
	public ArrayList<FishVO> fishCtgList(String fishCtgId) {
		return dao.fishCtgList(fishCtgId);
	}

	@Override
	public FishVO detailViewFish(String fishNo) {
		return dao.detailViewFish(fishNo);
	}

	@Override
	public ArrayList<FishVO> fishSearch(HashMap<String, Object> map) {
		return dao.fishSearch(map);
	}	

}
