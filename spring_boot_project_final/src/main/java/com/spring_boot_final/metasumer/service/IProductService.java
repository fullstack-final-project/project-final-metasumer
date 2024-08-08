package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import com.spring_boot_final.metasumer.model.ProductVO;

public interface IProductService {
  
  //모든 상품 조회(bizId로 필터링)
  public ArrayList<ProductVO> listAllProductByBizId(String bizId);
  
  //모든 상품 조회
  public ArrayList<ProductVO> listAllProduct(); 
  
  //상품 추가
  public void insertProduct(ProductVO product);

  // 상품 수정
  public void updateProduct(ProductVO product);

  // 상품 삭제
  public void deleteProduct(String prdNo);

  // 상세 상품 조회
  public ProductVO detailViewProduct(String prdNo);

  
}
