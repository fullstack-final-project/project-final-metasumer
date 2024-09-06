package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.EventVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

public interface IEventDAO {

	// 당해 연도 이벤트 경품 정보 불러오기
	public ArrayList<EventVO> getMyFishEventYear(int thisYear);
	
	// 이번 달 이벤트 상품 정보 불러오기
	public ArrayList<EventVO> getMyFishEventMonth(int thisMonth, int thisYear);
	
	// 2024년 나의 물고기 기록 순위 불러오기
	public ArrayList<MyFishRecordsVO> getYearMyFishRecord(int thisYear);
	
	// 이번 달 나의 물고기 기록 순위 불러오기
	public ArrayList<MyFishRecordsVO> getMonthMyFishRecord(int thisMonth, int thisYear);
	
	// 선주 이벤트 경품 정보 불러오기
	public ArrayList<EventVO> getBusinessEvent(int bizId, int spotId, int thisYear);
	
	// 사이트 이벤트 경품 정보 불러오기
	public ArrayList<EventVO> getSiteEvent(int thisYear);
}
