package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring_boot_final.metasumer.model.MyFishRecordsVO;

public interface IMyFishRecordsDAO {

	// 물고기기록 게시판 글 목록
	public ArrayList<MyFishRecordsVO> listAllMyFishRecords();

	// 내가 쓴 물고기기록 글 목록
	public List<MyFishRecordsVO> viewMyFishLogs(String recordNo);

	// 물고기기록 등록
	public void insertMyFishRecords(MyFishRecordsVO vo);

	// 물고기기록 수정
	public void updateMyFishRecords(MyFishRecordsVO vo);

	// 물고기기록 삭제
	public void deleteMyFishRecordsComment(String recordNo);

	public void deleteMyFishRecords(String recordNo);

	// 물고기기록 상세 보기
	public MyFishRecordsVO detailViewMyFishRecords(String recordNo);

	// 물고기기록 검색
	public ArrayList<MyFishRecordsVO> MyFishRecordsSearch(HashMap<String, Object> map);

	// 내가 쓴 기록만
	public ArrayList<MyFishRecordsVO> MyFishRecordsList(String memId);

	// 조회수
	public void countViews(String recordNo, String sidmemId);

}
