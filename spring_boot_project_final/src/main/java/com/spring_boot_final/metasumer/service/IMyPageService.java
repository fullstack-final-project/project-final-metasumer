package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.MyPageVO;
import com.spring_boot_final.metasumer.model.ReservationListVO;

public interface IMyPageService {
	// 내가 쓴 물고기 기록
	public ArrayList<MyPageVO> MyFishRecordsList(String memId);
	
	// 한 페이지에 가져올 물고기 기록
	public ArrayList<MyPageVO> MyFishRecordsPerPage(String memId, int offset, int limit);
	
	// 회원 별 기록 수(pagination)
	public int getRecordsCount(String memId);

	// 물고기 번호 가져오기
	public String getFishNoByName(String fishName);

	// 물고기 별 물때 점수
	public Integer getTideScore(String fishNo, String tide);

	// 물고기 별 위치 점수
	public Integer getLocationScore(String fishNo, String location);

	// 물고기 별 날씨 점수
	public Integer getWeatherScore(String fishNo, String weather);

	// 물고기 별 숙련도 점수
	public Integer getSkillScore(String skill);

	// 물고기 별 운세 점수
	public Integer getFortuneScore(String fortune);

	// 물고기 별 공통 점수
	public Integer getCommonScore(String importanceCtgId, String commonValue);

	// 회원 정보
	public MemberVO getMemberInfo(String memId);
	
	// 비밀번호 체크
	public String passwordCheck(HashMap<String, Object> map);
	
	// 회원 정보 수정
	public boolean updateMemberInfo(HashMap<String, Object> map);
	
	// 나의 예약
	// 예약 내역 필터링해서 조회
	public ArrayList<ReservationListVO> reservationList(String memId, String startDate, String endDate);

}
