package com.spring_boot_final.metasumer.service;

import java.util.List;

import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;
import com.spring_boot_final.metasumer.model.FishingSpotVO;

public interface IFishingSpotService {
  // 낚시터 타입 별 리스트(민물, 바다)
  public List<FishingSpotVO> getFishingSpotsByType(String spotType);
  
  // 낚시터 상세 조회
  public FishingSpotVO detailFishingSpot(int spotId);
  
  // 낚시터 구역 전체 조회
  public List<FishingSpotAreaVO> getFishingSpotAreasBySpotId(int spotId);
  
  // 낚시터 구역 상세 조회
  public FishingSpotAreaVO getFishingSpotAreaById(int areaId);
  
  // 사업자 ID 별 낚시터 조회
  public List<FishingSpotVO> getFishingSpotsByBizId(int bizId);
  
  //낚시터 등록 메서드
  public void insertFishingSpot(FishingSpotVO fishingSpot); 
  
  //낚시터 구역 등록
  public void insertFishingSpotArea(FishingSpotAreaVO fishingSpotArea);
}
