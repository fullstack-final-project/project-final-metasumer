package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IFishingDAO;
import com.spring_boot_final.metasumer.model.FishingDetailVO;
import com.spring_boot_final.metasumer.model.FishingVO;

@Service
public class FishingService implements IFishingService {
	@Autowired
	@Qualifier("IFishingDAO")
	IFishingDAO dao;

	@Override
	public ArrayList<FishingVO> fishingCtgList(String fishingCtgId) {
		return dao.fishingCtgList(fishingCtgId);
	}

	@Override
	public ArrayList<FishingDetailVO> fishingDetail(String fishingCtgId) {
		return dao.fishingDetail(fishingCtgId);
	}

}
