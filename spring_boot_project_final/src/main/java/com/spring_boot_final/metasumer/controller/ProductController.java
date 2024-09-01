package com.spring_boot_final.metasumer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.spring_boot_final.metasumer.model.ProductVO;
import com.spring_boot_final.metasumer.service.ProductService;

@Controller
public class ProductController {
  @Autowired
  private ProductService prdService;

  
  //사업체가 등록한 상품 조회
//  @RequestMapping("/product/productManagement")
//  public String listProductsByBizId(@RequestParam("bizId") Integer bizId, Model model) {
//      // 서비스에게 사업체 ID 전달하고, 해당 사업체의 상품 데이터 받아오기
//      ArrayList<ProductVO> prdList = prdService.listAllProductByBizId(bizId);
//      
//      // 뷰 페이지에 출력하기 위해 Model 설정
//      model.addAttribute("prdList", prdList);
//      
//      return "product/productManagement";
//  }
 
  
  //상품 등록 폼 열기
  @RequestMapping("/product/insertProductForm")
  public String insertProductForm(Model model) {
    // 카테고리 목록을 서비스에서 가져옴
    ArrayList<ProductVO> categoryList = prdService.listAllCategories();
    model.addAttribute("categoryList", categoryList);
    return "product/insertProductForm";
  }  
  
  @RequestMapping("/product/insertProduct")
  @ResponseBody
  public Map<String, Object> registerProduct(@RequestParam("prdNo") String prdNo,
                                             @RequestParam("prdImage") MultipartFile file,
                                             @RequestParam("prdName") String prdName,
                                             @RequestParam("prdPrice") Integer prdPrice,
                                             @RequestParam("prdStock") Integer prdStock,
                                             @RequestParam("prdMaker") String prdMaker,
                                             @RequestParam("prdDescript") String prdDescript,
                                             @RequestParam("bizId") Integer bizId,
                                             @RequestParam("prdCtgId") Integer prdCtgId) {
      Map<String, Object> response = new HashMap<>();
      try {
          // 파일 저장
          String fileName = saveFile(file);
          System.out.println("파일 등록 성공: " + fileName);

          // ProductVO 객체 생성
          ProductVO product = new ProductVO();
          product.setPrdNo(prdNo);
          product.setPrdName(prdName);
          product.setPrdPrice(prdPrice);
          product.setPrdStock(prdStock);
          product.setPrdMaker(prdMaker);
          product.setPrdDescript(prdDescript);
          product.setPrdImage(fileName);
          product.setBizId(bizId);
          product.setPrdCtgId(prdCtgId);

          // 제품 등록
          prdService.insertProduct(product);

          response.put("status", "success");
          response.put("redirectUrl", "/product/productManagement");
      } catch (IOException e) {
          e.printStackTrace();
          response.put("status", "fail");
          response.put("error", "파일 저장 중 오류 발생: " + e.getMessage());
      } catch (Exception e) {
          e.printStackTrace();
          response.put("status", "fail");
          response.put("error", "제품 등록 중 오류 발생: " + e.getMessage());
      }
      return response;
  }
  
  private String saveFile(MultipartFile file) throws IOException {
    String uploadPath = "C:/springWorkspace/metasumer_images_upload/";

    String originalFileName = file.getOriginalFilename();
    originalFileName = originalFileName.replace("[", "_").replace("]", "_");

    UUID uuid = UUID.randomUUID();
    String savedFileName = uuid.toString() + "_" + originalFileName;
    File uploadFile = new File(uploadPath + savedFileName);

    file.transferTo(uploadFile);

    return savedFileName;
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
    ProductVO product = prdService.detailViewProduct(prdNo);
    
    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("product", product);
    
    return "product/productDetailView";
  }
  
  // 상품 정보 수정 화면 열기
  // 상품 정보를 수정하기 위해 먼저 상품 정보를 출력 : 상세 정보 출력 (입력 폼에)
  // detailViewProduct() 사용해서 정보 먼저 출력
  @RequestMapping("/product/updateProductForm/{prdNo}")
  public String updateProductForm(@PathVariable String prdNo, Model model) {
    // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
    ProductVO prd = prdService.detailViewProduct(prdNo);
    ArrayList<ProductVO> categoryList = prdService.listAllCategories();
    
    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("prd", prd);
    model.addAttribute("categoryList", categoryList);
    
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
  
  //////////////////////////////////////////////////////////////
  
  //모든 상품 조회
  @RequestMapping("/product/productManagement")
  public String listAllProduct(Model model) {
    // 서비스에게 요청하여 전체 상품 데이터 받아오기
    ArrayList<ProductVO> prdList = prdService.listAllProduct();

    // 뷰 페이지에 출력하기 위해 Model 설정
    model.addAttribute("prdList", prdList);

    return "product/productManagement";
  }
  
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
  
 ///////////////////////////////////////////////////////////////////////////////////////////
 
  
  
}
