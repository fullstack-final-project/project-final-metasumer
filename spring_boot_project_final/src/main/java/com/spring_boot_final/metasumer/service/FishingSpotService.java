package com.spring_boot_final.metasumer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IFishingSpotAreaDAO;
import com.spring_boot_final.metasumer.dao.IFishingSpotDAO;
import com.spring_boot_final.metasumer.model.FishingSpotAreaVO;
import com.spring_boot_final.metasumer.model.FishingSpotVO;

@Service
public class FishingSpotService implements IFishingSpotService {
  @Autowired
  @Qualifier("IFishingSpotDAO")
  IFishingSpotDAO fishingSpotDAO;
  
  @Autowired
  @Qualifier("IFishingSpotAreaDAO")
  IFishingSpotAreaDAO fishingSpotAreaDAO;
  

  @Override
  public List<FishingSpotVO> getFishingSpotsByType(String spotType) {
    return fishingSpotDAO.getFishingSpotsByType(spotType);
  }
  
  @Override
  public FishingSpotVO detailFishingSpot(int spotId) {
    return fishingSpotDAO.detailFishingSpot(spotId);
  }

  @Override
  public List<FishingSpotAreaVO> getFishingSpotAreasBySpotId(int spotId) {
    return fishingSpotAreaDAO.getFishingSpotAreasBySpotId(spotId);
  }
  
  @Override
  public FishingSpotAreaVO getFishingSpotAreaById(int areaId) {
    return fishingSpotAreaDAO.getFishingSpotAreaById(areaId);
  }
  
  @Override
  public List<FishingSpotVO> getFishingSpotsByBizId(int bizId) {
    return fishingSpotDAO.getFishingSpotsByBizId(bizId);
  }
  
  @Override
  public void insertFishingSpot(FishingSpotVO fishingSpot) {
    fishingSpotDAO.insertFishingSpot(fishingSpot);
  }

  @Override
  public void insertFishingSpotArea(FishingSpotAreaVO fishingSpotArea) {
    fishingSpotAreaDAO.insertFishingSpotArea(fishingSpotArea);
  }
  
  @Override
  public void updateFishingSpotArea(FishingSpotAreaVO area) {
    fishingSpotAreaDAO.updateFishingSpotArea(area);
  }
  
  @Override
  public void deleteFishingSpotArea(int areaId) {
    fishingSpotAreaDAO.deleteFishingSpotArea(areaId);
  }
  
  @Override
  public void updateFishingSpot(FishingSpotVO fishingSpot) {
    fishingSpotDAO.updateFishingSpot(fishingSpot);
  }
  
  @Override
  public void deleteFishingSpot(int spotId) {
    fishingSpotDAO.deleteFishingSpot(spotId);
  }

}
