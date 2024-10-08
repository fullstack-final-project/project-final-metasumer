package com.spring_boot_final.metasumer.dao;

import java.util.List;

import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;

public interface IFishingSpotAreaDAO {
  //낚시터 자리 상품
  public List<FishingSpotAreaVO> getFishingSpotAreasBySpotId(int spotId);
  
  //낚시터 구역 상세 상품 조회
  public FishingSpotAreaVO getFishingSpotAreaById(int areaId);
  
  // 낚시터 구역 등록
  public void insertFishingSpotArea(FishingSpotAreaVO fishingSpotArea);
  
  //낚시터 구역 정보 업데이트
  public void updateFishingSpotArea(FishingSpotAreaVO area);
  
  //낚시터 구역 삭제
  public void deleteFishingSpotArea(int areaId);
}
