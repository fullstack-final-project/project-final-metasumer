package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.MyFishRecordsVO;
import com.spring_boot_final.metasumer.model.ProductVO;

public interface IIndexService {
	
	// 전체 회원 기록 불러오기 (index 페이지에서 이용) : 크기순으로 나열
	public ArrayList<MyFishRecordsVO> listBestMemFishRecords();
	
	// 베스트 업체 리스크 불러오기 : 임의로 선정
	public ArrayList<BusinessVO> listBestBusinessRank();
	
	// 최신 회원 기록 불러오기 : 날짜순으로 나열
	public ArrayList<MyFishRecordsVO> listNewMemFishRecords();
	
	// 신상품 불러오기 : 상품번호순으로 나열
	public ArrayList<ProductVO> listNewProducts();
	
	// 사용자 기반 추천 상품 : 알고리즘 사용 예정 (현재는 임의로 추출중)
	public ArrayList<ProductVO> listUserRecProducts();
	
	
}
