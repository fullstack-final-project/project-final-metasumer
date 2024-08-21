package com.spring_boot_final.metasumer.dao;

import java.util.List;

import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;

public interface IFishingSpotAreaDAO {
  //낚시터 자리 상품
  public List<FishingSpotAreaVO> getFishingSpotAreasBySpotId(int spotId);

}
