package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.ReservationVO;
import com.spring_boot_final.metasumer.service.ReservationService;

@Controller
@RequestMapping("/business")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;
        
    @RequestMapping("/")
    public String index() {
      return "index";
    }
    
    // 사업자 메인 페이지
    @RequestMapping("/businessMain")
    public String businessMain() {
      return "business/businessMain";
    }
    
    // 예약 관리 대쉬보드
    @RequestMapping("/dashboard")
    public String showDashboard(Model model, @RequestParam(value = "bizCtgId", defaultValue = "1") int bizCtgId) {
        ArrayList<ReservationVO> reservations = reservationService.listReservationByCategory(bizCtgId);
        model.addAttribute("reservations", reservations);
        model.addAttribute("bizCtgId", bizCtgId);
        return "business/dashboard";
    }
    
    @RequestMapping("/listReservationByCategory")
    @ResponseBody
    public ArrayList<ReservationVO> listReservationByCategory(@RequestParam(value = "bizCtgId", defaultValue = "1") int bizCtgId) {
        return reservationService.listReservationByCategory(bizCtgId);
    }
    
    @GetMapping("/getReservations")
    @ResponseBody
    public ArrayList<ReservationVO> getReservations() {
        return reservationService.getAllReservations();
    }
    

    // 예약 확정
    @RequestMapping("/confirmReservation/{resNo}")
    public String confirmReservation(@PathVariable int resNo, @RequestParam int bizCtgId) {
        // bizCtgId에 따라 다른 로직 수행
        reservationService.confirmReservation(resNo, bizCtgId);
        return "redirect:/business/dashboard?bizCtgId=" + bizCtgId;
    }

    // 예약 취소
    @RequestMapping("/cancelReservation/{resNo}")
    public String cancelReservation(@PathVariable int resNo, @RequestParam int bizCtgId) {
        // bizCtgId에 따라 다른 로직 수행
        reservationService.cancelReservation(resNo, bizCtgId);
        return "redirect:/business/dashboard?bizCtgId=" + bizCtgId;
    }
    
 ///////////////////////////////////////////////////////////////////////////
    
    // 업체 등록
//    @GetMapping("/register")
//    public String showRegisterForm(Model model) {
//        // 카테고리 리스트를 가져와서 폼에 전달
//        ArrayList<BizCategory> bizCategories = businessService.getAllCategories();
//        model.addAttribute("bizCategories", bizCategories);
//        return "registerBusiness";
//    }

    
}
