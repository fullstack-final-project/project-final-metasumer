package com.spring_boot_final.metasumer.dao;

import java.util.List;

import com.spring_boot_final.metasumer.model.FishingSpotVO;

public interface IFishingSpotDAO {
  // 낚시터 타입 별 리스트
  public List<FishingSpotVO> getFishingSpotsByType(String spotType);
  
  // 낚시터 상세 조회 
  public FishingSpotVO detailFishingSpot(int spotId);
  
  //사업자 ID 별 낚시터 조회
  public List<FishingSpotVO> getFishingSpotsByBizId(int bizId);
  
  //낚시터 등록 메서드
  public void insertFishingSpot(FishingSpotVO fishingSpot); 
}
