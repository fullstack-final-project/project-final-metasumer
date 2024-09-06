package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.model.FishVO;

@Service
public interface IFishService {
	// 전체 어종 조회
	public ArrayList<FishVO> listAllFish(int offset, int limit);
	
	// pagination(어종 수)
	public int getFishCount();
		
	// 카테고리 별 어종 조회
	public ArrayList<FishVO> fishCtgList(String fishCtgId);
	
	// 어종 별 상세 정보
	public FishVO detailViewFish(String fishNo);
	
	// 어종 검색
	public ArrayList<FishVO> fishSearch(HashMap<String, Object> map);
}
