package com.spring_boot_final.metasumer.controller;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderVO;
import com.spring_boot_final.metasumer.model.ProductVO;
import com.spring_boot_final.metasumer.model.SalesVO;
import com.spring_boot_final.metasumer.service.MemberService;
import com.spring_boot_final.metasumer.service.OrderService;
import com.spring_boot_final.metasumer.service.ProductService;
import com.spring_boot_final.metasumer.service.SalesService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
  @Autowired
  private MemberService memberService;
  
  @Autowired
  private ProductService prdService;
  
  @Autowired
  private OrderService orderService;
  
  @Autowired
  private SalesService salesService;
  
  @RequestMapping("/order/productOrder")
  public String productOrder(@RequestParam("prdNo") String prdNo,
                             @RequestParam("prdPrice") int prdPrice,
                             @RequestParam("quantity") int quantity,
                             HttpSession session, Model model) {
      String memId = (String) session.getAttribute("memId");
 
      if (memId != null) {
          MemberVO member = memberService.getMemberById(memId);
          model.addAttribute("member", member);
          
          ProductVO product = prdService.detailViewProduct(prdNo);
          
          // 총 상품 가격 계산
          int productTotal = prdPrice * quantity;

          // 배송비 결정
          int deliveryCost = productTotal >= 50000 ? 0 : 3000;

          // 총 결제 금액 계산
          int finalTotalPrice = productTotal + deliveryCost;

          // 모델에 추가
          model.addAttribute("product", product);
          model.addAttribute("quantity", quantity);
          model.addAttribute("productTotal", productTotal);
          model.addAttribute("deliveryCost", deliveryCost);
          model.addAttribute("finalTotalPrice", finalTotalPrice);
          
          return "/order/productOrder";  
      } else {
          return "redirect:/member/loginForm";  // 로그인 페이지로 리다이렉트
      }
  }
  
  @RequestMapping("/order/productComplete")
  public ModelAndView productComplete(
      @RequestParam("prdNo") String prdNo,
      @RequestParam(value = "quantity", defaultValue = "0") int quantity,
      @RequestParam(value = "ordererName", defaultValue = "") String ordererName,
      @RequestParam(value = "ordererHp1", defaultValue = "") String ordererHp1,
      @RequestParam(value = "ordererHp2", defaultValue = "") String ordererHp2,
      @RequestParam(value = "ordererHp3", defaultValue = "") String ordererHp3,
      @RequestParam(value = "ordererEmail", defaultValue = "") String ordererEmail,
      @RequestParam(value = "shippingZipcode", defaultValue = "") String shippingZipcode,
      @RequestParam(value = "shippingAddress1", defaultValue = "") String shippingAddress1,
      @RequestParam(value = "shippingAddress2", defaultValue = "") String shippingAddress2,
      @RequestParam(value = "finalTotalPrice", defaultValue = "0") int finalTotalPrice,
      @RequestParam(value = "deliveryCost", defaultValue = "0") int deliveryCost,
      @RequestParam(value = "prdPrice", defaultValue = "0") int prdPrice
  ) {
      // 상품 정보 조회
      ProductVO product = prdService.detailViewProduct(prdNo);
      int bizId = product.getBizId(); // 상품의 사업자 ID를 가져온다.

      // OrderVO 객체 생성 및 데이터 설정
      OrderVO order = new OrderVO();
      order.setPrdNo(prdNo);
      order.setQuantity(quantity);
      order.setOrderDate(new Date()); // 현재 시간
      order.setBuyerName(ordererName);
      order.setBuyerHP(ordererHp1 + "-" + ordererHp2 + "-" + ordererHp3);
      order.setBuyerEmail(ordererEmail);
      order.setShippingZipcode(shippingZipcode);
      order.setShippingAddress1(shippingAddress1);
      order.setShippingAddress2(shippingAddress2);
      order.setBizId(bizId);
      order.setTotalPrice(finalTotalPrice);

      // Order 저장
      orderService.saveOrder(order);

      // SalesVO 객체 생성 및 데이터 설정
      SalesVO sale = new SalesVO();
      sale.setPrdNo(prdNo);
      sale.setSaleDate(new Date()); // 현재 날짜
      sale.setSaleQuantity(quantity);
      sale.setSalePrice(prdPrice * quantity);
      sale.setBizId(bizId);

      // Sales 저장
      salesService.saveSale(sale);
      
      
      return new ModelAndView("redirect:/product/productList");
  }
  
}

  
  

