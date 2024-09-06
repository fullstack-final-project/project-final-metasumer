package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.ReservationVO;
import com.spring_boot_final.metasumer.service.ReservationService;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService reservationService;
        
   
    // 예약 관리 대쉬보드
    @RequestMapping("/business/dashboard")
    public String showDashboard(Model model) {
        ArrayList<ReservationVO> reservations = reservationService.getAllReservations();
        model.addAttribute("reservations", reservations);
        return "business/dashboard";
    }
    
    // 모든 예약 정보 조회
    @RequestMapping("/business/listAllReservations")
    public @ResponseBody ArrayList<ReservationVO> listAllReservations() {
        return reservationService.getAllReservations();
    }
    
    // 사업자별 예약 정보 조회(로그인 후 사용)
//    @RequestMapping("/business/listReservationsByBizId/{bizId}")
//    public @ResponseBody ArrayList<ReservationVO> listReservationsByBizId(@PathVariable int bizId) {
//        return reservationService.getReservationsByBusiness(bizId);
//    }
    

    // 예약 확정
    @RequestMapping("/business/confirmReservation/{resNo}")
    public String confirmReservation(@PathVariable int resNo) {
        reservationService.confirmReservation(resNo);
        return "redirect:/business/dashboard";
    }

    // 예약 취소
    @RequestMapping("/business/cancelReservation/{resNo}")
    public String cancelReservation(@PathVariable int resNo) {
        reservationService.cancelReservation(resNo);
        return "redirect:/business/dashboard";
    }
    
 ///////////////////////////////////////////////////////////////////////////
    
    // 업체 등록
//    @GetMapping("/business/register")
//    public String showRegisterForm(Model model) {
//        // 카테고리 리스트를 가져와서 폼에 전달
//        ArrayList<BizCategory> bizCategories = businessService.getAllCategories();
//        model.addAttribute("bizCategories", bizCategories);
//        return "registerBusiness";
//    }

   ///////////////////////////////////////////////////////////////////////////
    
}
