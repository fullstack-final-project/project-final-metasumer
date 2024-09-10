package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IEventDAO;
import com.spring_boot_final.metasumer.model.EventVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

@Service
public class EventService implements IEventService {
	
	@Autowired
	@Qualifier("IEventDAO")
	IEventDAO dao;

	@Override
	public ArrayList<EventVO> getMyFishEventYear(int thisYear) {
		// 당해 연도 이벤트 경품 정보 불러오기
		return dao.getMyFishEventYear(thisYear);
	}

	@Override
	public ArrayList<EventVO> getMyFishEventMonth(int thisMonth, int thisYear) {
		// 이번 달 이벤트 상품 정보 불러오기
		return dao.getMyFishEventMonth(thisMonth, thisYear);
	}

	@Override
	public ArrayList<EventVO> getBusinessEvent(int bizId, int spotId, int thisYear) {
		// 선주 이벤트 경품 정보 불러오기
		return dao.getBusinessEvent(bizId, spotId, thisYear);
	}

	@Override
	public ArrayList<EventVO> getSiteEvent(int thisYear) {
		// 사이트 이벤트 경품 정보 불러오기
		return dao.getSiteEvent(thisYear);
	}

	@Override
	public ArrayList<MyFishRecordsVO> getYearMyFishRecord(int thisYear) {
		// 2024년 나의 물고기 기록 순위 불러오기
		return dao.getYearMyFishRecord(thisYear);
	}

	@Override
	public ArrayList<MyFishRecordsVO> getMonthMyFishRecord(int thisMonth, int thisYear) {
		// 이번 달 나의 물고기 기록 순위 불러오기
		return dao.getMonthMyFishRecord(thisMonth, thisYear);
	}

}
