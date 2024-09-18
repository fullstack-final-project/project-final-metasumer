package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.OrderVO;
import com.spring_boot_final.metasumer.model.ProductVO;
import com.spring_boot_final.metasumer.service.BusinessService;
import com.spring_boot_final.metasumer.service.OrderService;
import com.spring_boot_final.metasumer.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
  @Autowired
  private ProductService prdService;
  @Autowired
  private BusinessService businessService;
  @Autowired
  private OrderService orderService;

  
  // 상품관리 페이지 열기
  @RequestMapping("/product/productManagement")
  public String listProductsByBizId(@RequestParam("bizId") int bizId, Model model) {
      // 사업자 ID에 해당하는 제품 목록 조회
      ArrayList<ProductVO> prdList = prdService.listAllProductByBizId(bizId);
      ArrayList<ProductVO> categoryList = prdService.listAllCategories();
      // 모든 주문 내역 조회
      List<OrderVO> orderHistory = orderService.findAllOrders(bizId);
      // 모델에 데이터 추가
      model.addAttribute("categoryList", categoryList);
      model.addAttribute("prdList", prdList);
      model.addAttribute("bizId", bizId);
      model.addAttribute("orderHistory", orderHistory);
      
      return "product/productManagement";
  }
 
  
  //상품 등록 폼 열기
  @RequestMapping("/product/insertProductForm")
  public String insertProductForm(@RequestParam("bizId") int bizId, Model model) {
    
    // 카테고리 목록을 서비스에서 가져옴
    ArrayList<ProductVO> categoryList = prdService.listAllCategories();
    
    model.addAttribute("categoryList", categoryList);
    model.addAttribute("bizId", bizId);
    
    return "product/insertProductForm";
  }  
  
  // 상품 등록 처리
  @RequestMapping("/product/insertProduct")
  public String insertProduct(
          @RequestParam("prdNo") String prdNo,
          @RequestParam("prdName") String prdName,
          @RequestParam("prdPrice") int prdPrice,
          @RequestParam("prdStock") int prdStock,
          @RequestParam("prdCtgId") int prdCtgId,
          @RequestParam("prdMaker") String prdMaker,
          @RequestParam("prdDescript") String prdDescript,
          @RequestParam("prdImage") MultipartFile prdImage,
          @RequestParam("bizId") int bizId,
          HttpSession session) throws IOException {
    
     
      
      // 상품 이미지 저장
      String savedImageName = saveFile(prdImage);
      
      // ProductVO 객체 생성 및 데이터 설정
      ProductVO product = new ProductVO();
      product.setPrdNo(prdNo);
      product.setPrdName(prdName);
      product.setPrdPrice(prdPrice);
      product.setPrdStock(prdStock);
      product.setPrdCtgId(prdCtgId);
      product.setPrdMaker(prdMaker);
      product.setPrdDescript(prdDescript);
      product.setPrdImage(savedImageName);
      product.setBizId(bizId);
      
      // 상품 등록 서비스 호출
      prdService.insertProduct(product);

      // 상품 목록 페이지로 리다이렉트
      return "redirect:/product/productManagement?bizId=" + bizId;
  }
  
  
  // 상품 상세 정보 조회
  @RequestMapping("/product/detailViewProduct/{prdNo}")
  public String detailViewProduct(@PathVariable String prdNo, Model model) {
    // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
    ProductVO product = prdService.detailViewProduct(prdNo);
    
    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("product", product);
    
    return "product/productDetailView";
  }
  
  // 상품 정보 수정 화면 열기
  // 상품 정보를 수정하기 위해 먼저 상품 정보를 출력 : 상세 정보 출력 (입력 폼에)
  // detailViewProduct() 사용해서 정보 먼저 출력
  @RequestMapping("/product/updateProductForm/{prdNo}")
  public String updateProductForm(@PathVariable String prdNo, @RequestParam("bizId") int bizId, Model model) {
    // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
    ProductVO prd = prdService.detailViewProduct(prdNo);
    ArrayList<ProductVO> categoryList = prdService.listAllCategories();
    BusinessVO business = businessService.getBusinessByBizId(bizId);
    
    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("prd", prd);
    model.addAttribute("categoryList", categoryList);
    model.addAttribute("business", business);
    
    return "product/updateProductForm";
  }
  
  // 상품정보 수정
  @RequestMapping("/product/updateProduct")
  public String updateProduct(ProductVO vo,
                              @RequestParam(value = "prdImage", required = false) MultipartFile file,
                              @RequestParam("bizId") int bizId) throws IOException {
    
    
      // 기존 상품 정보 가져오기
      ProductVO existingProduct = prdService.detailViewProduct(vo.getPrdNo());
      
      // 상품 이미지 처리
      String savedFileName = existingProduct.getPrdImage(); // 기본적으로 기존 이미지 사용
      if (vo.getPrdImageFile() != null && !vo.getPrdImageFile().isEmpty()) {
        savedFileName = saveFile(vo.getPrdImageFile()); // 새 이미지 저장
      }
      
      // ProductVO 객체 설정
      vo.setPrdImage(savedFileName); // 기존 이미지 또는 새 이미지로 설정
      vo.setBizId(bizId);
      
      // 상품 수정 서비스 호출
      prdService.updateProduct(vo);

      // 상품 목록 페이지로 리다이렉트
      return "redirect:/product/productManagement?bizId=" + bizId;
  }
  
  // 상품 정보 삭제 
  @RequestMapping("/product/deleteProduct/{prdNo}")
  public String deleteProduct(@PathVariable String prdNo,
                              @RequestParam("bizId") int bizId) {
    prdService.deleteProduct(prdNo); 
    return "redirect:/product/productManagement?bizId=" + bizId;
  }
  
  //////////////////////////////////////////////////////////////
  
  //모든 상품 조회
//  @RequestMapping("/product/productManagement")
//  public String listAllProduct(Model model) {
//    // 서비스에게 요청하여 전체 상품 데이터 받아오기
//    ArrayList<ProductVO> prdList = prdService.listAllProduct();
//
//    // 뷰 페이지에 출력하기 위해 Model 설정
//    model.addAttribute("prdList", prdList);
//
//    return "product/productManagement";
//  }
  
  // 상품 리스트
  @RequestMapping("/product/productList")
  public String productList(Model model) {
      ArrayList<ProductVO> bestProducts = prdService.getBestProduct();
      ArrayList<ProductVO> newProducts = prdService.getNewProduct();

      // 카테고리별 상품 데이터 조회
      Map<String, ArrayList<ProductVO>> categoryProducts = new HashMap<>();
      categoryProducts.put("낚싯대", prdService.getProductsByCategory("낚싯대"));
      categoryProducts.put("미끼", prdService.getProductsByCategory("미끼"));
      categoryProducts.put("릴", prdService.getProductsByCategory("릴"));
      categoryProducts.put("의류/장비", prdService.getProductsByCategory("의류/장비"));
      categoryProducts.put("기타 액세서리", prdService.getProductsByCategory("기타 액세서리"));

      model.addAttribute("bestProducts", bestProducts);
      model.addAttribute("newProducts", newProducts);
      model.addAttribute("categoryProducts", categoryProducts);

      return "product/productList";
  }
  
  //중복 확인
   @ResponseBody
   @RequestMapping("/product/prdNoCheck")
   public String bookNoCheck(@RequestParam("prdNo") String prdNo) {
     
     String prdNo_result = prdService.prdNoCheck(prdNo);
     String result = "available";
     if(prdNo_result != null) { // 도서번호가 존재한다면
        result = "not_available";
     }
     
     return result;
   }
 ///////////////////////////////////////////////////////////////////////////////////////////
  private String saveFile(MultipartFile file) throws IOException {
    String uploadPath = "C:/springWorkspace/metasumer_images/";

    String originalFileName = file.getOriginalFilename();
    originalFileName = originalFileName.replace("[", "_").replace("]", "_");

    UUID uuid = UUID.randomUUID();
    String savedFileName = uuid.toString() + "_" + originalFileName;
    File uploadFile = new File(uploadPath + savedFileName);

    file.transferTo(uploadFile);

    return savedFileName;
  }
  
  
}
