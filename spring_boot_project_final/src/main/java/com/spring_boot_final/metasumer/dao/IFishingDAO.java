package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.FishingDetailVO;
import com.spring_boot_final.metasumer.model.FishingVO;

public interface IFishingDAO {		
	// 카테고리 낚시 정보 조회
	public ArrayList<FishingVO> fishingCtgList(String fishingCtgId);
	
	// 서브 카테고리 낚시 정보 조회
	public ArrayList<FishingDetailVO> fishingDetail(String fishingCtgId);

}
