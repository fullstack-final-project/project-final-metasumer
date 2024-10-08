package com.spring_boot_final.metasumer.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring_boot_final.metasumer.model.ProductVO;

public interface IProductDAO {
  //모든 상품 조회(bizId로 필터링)
  public ArrayList<ProductVO> listAllProductByBizId(Integer bizId);
  
  //모든 상품 조회
  public ArrayList<ProductVO> listAllProduct();
  
  //상품 추가
  public void insertProduct(ProductVO product);

  // 상품 수정
  public void updateProduct(ProductVO product);

  // 상품 삭제
  public void deleteProduct(String prdNo);

  // 상품 조회
  public ProductVO detailViewProduct(String prdNo);
  
  // 베스트 상품
  public ArrayList<ProductVO> getBestProduct();
  
  // 신상품
  public ArrayList<ProductVO> getNewProduct();
  
  // 카테고리 목록 조회
  public ArrayList<ProductVO> listAllCategories();
  
  //카테고리 별 상품 조회
  public ArrayList<ProductVO> getProductsByCategory(String category);
  
  //사업자ID 별 상품 목록 가져오기
  public List<ProductVO> getProductsByBizId(int bizId);
  
  //상품번호 중복 체크
  public String prdNoCheck(String prdNo);

}
