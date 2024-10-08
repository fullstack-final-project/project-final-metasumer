package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.model.FishingDetailVO;
import com.spring_boot_final.metasumer.model.FishingVO;
import com.spring_boot_final.metasumer.model.ProductVO;

@Service
public interface IFishingService {
	// 카테고리 낚시 정보 조회
	public ArrayList<FishingVO> fishingCtgList(String fishingCtgId);
		
	// 서브 카테고리 낚시 정보 조회
	public ArrayList<FishingDetailVO> fishingDetail(String fishingCtgId);
	
	// 세부 카테고리 상품 3개 랜덤 조회
	public ArrayList<ProductVO> getRandomProducts(String fishingDetailCtgId);
}
