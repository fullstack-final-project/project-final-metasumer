package com.spring_boot_final.metasumer.dao;

import java.util.List;

import com.spring_boot_final.metasumer.model.FishingSpotVO;

public interface IFishingSpotDAO {
  // 낚시터 타입 별 리스트
  public List<FishingSpotVO> getFishingSpotsByType(String spotType);
  
  // 낚시터 상세 조회 
  public FishingSpotVO detailFishingSpot(int spotId);
}
