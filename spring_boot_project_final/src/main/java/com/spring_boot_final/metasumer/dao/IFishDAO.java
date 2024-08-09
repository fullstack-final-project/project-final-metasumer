package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_final.metasumer.model.FishVO;

public interface IFishDAO {
	// 전체 어종 조회
	public ArrayList<FishVO> listAllFish();
	
	// 카테고리 별 어종 조회
	public ArrayList<FishVO> fishCtgList(String fishCtgId);
	
	// 어종 별 상세 정보
	public FishVO detailViewFish(String fishNo);
	
	// 어종 검색
	public ArrayList<FishVO> fishSearch(HashMap<String, Object> map);
}
