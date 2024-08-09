package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_final.metasumer.model.ProductVO;
import com.spring_boot_final.metasumer.service.ProductService;

@Controller
public class ProductController {
  @Autowired
  private ProductService prdService;
  
  // 상품 관리 폼 열기
//  @RequestMapping("/productManagement")
//  public String productManagement() {
//    return "product/productManagement";
//  }
  
  //사업체가 등록한 상품 조회
  @RequestMapping("/product/listProductsByBizId")
  public String listProductsByBizId(@RequestParam("bizId") String bizId, Model model) {
      // 서비스에게 사업체 ID 전달하고, 해당 사업체의 상품 데이터 받아오기
      ArrayList<ProductVO> prdList = prdService.listAllProductByBizId(bizId);
      
      // 뷰 페이지에 출력하기 위해 Model 설정
      model.addAttribute("prdList", prdList);
      
      return "product/productListByBizId";
  }
  
  // 모든 상품 조회
  @RequestMapping("/product/productManagement")
  public String listAllProduct(Model model) {
      // 서비스에게 요청하여 전체 상품 데이터 받아오기
      ArrayList<ProductVO> prdList = prdService.listAllProduct();
      
      // 뷰 페이지에 출력하기 위해 Model 설정
      model.addAttribute("prdList", prdList);
      
      return "product/productManagement";
  }
  
  //상품 등록 폼 열기
  @RequestMapping("/product/insertProductForm")
  public String insertProductForm() {
    return "product/insertProductForm";
  }  
  
  // 상품 등록 
  @RequestMapping("/product/insertProduct")
  public String insertProduct(ProductVO vo) {
    prdService.insertProduct(vo);   
    return "redirect:/product/productManagement";
  }
  
  // 상품 등록(로그인 했을 경우 bizId 처리: 추후에 사용)
//  @RequestMapping("/product/insertProduct")
//  public String insertProduct(ProductVO vo, HttpSession session) {
//      User user = (User) session.getAttribute("user"); // 세션에서 사용자 객체 가져오기
//      if (user != null) {
//          int bizId = user.getBizId(); // 사용자 객체에서 bizId 가져오기
//          product.setBizId(bizId); // 상품 객체에 bizId 설정
//          prdService.insertProduct(vo);
//      }
//      return "redirect:/productManagement";
//  }
  
  // 상품 상세 정보 조회
  @RequestMapping("/product/detailViewProduct/{prdNo}")
  public String detailViewProduct(@PathVariable String prdNo, Model model) {
    // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
    ProductVO prd = prdService.detailViewProduct(prdNo);
    
    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("prd", prd);
    
    return "product/productDetailView";
  }
  
  // 상품 정보 수정 화면 열기
  // 상품 정보를 수정하기 위해 먼저 상품 정보를 출력 : 상세 정보 출력 (입력 폼에)
  // detailViewProduct() 사용해서 정보 먼저 출력
  @RequestMapping("/product/updateProductForm/{prdNo}")
  public String updateProductForm(@PathVariable String prdNo, Model model) {
    // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
    ProductVO prd = prdService.detailViewProduct(prdNo);
    
    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("prd", prd);
    
    return "product/updateProductForm"; // 폼에 데이터 출력
  }
  
  // 수정된 데이터 받아서 DB에 저장
  @RequestMapping("/product/updateProduct")
  public String updateProduct(ProductVO vo) {
    prdService.updateProduct(vo);   
    return "redirect:/product/productManagement";
  }
  
  // 상품 정보 삭제 
  @RequestMapping("/product/deleteProduct/{prdNo}")
  public String deleteProduct(@PathVariable String prdNo) {
    prdService.deleteProduct(prdNo);  
    return "redirect:/product/productManagement";
  }
}
