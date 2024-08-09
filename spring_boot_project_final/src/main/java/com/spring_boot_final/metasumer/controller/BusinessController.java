package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.ReservationVO;
import com.spring_boot_final.metasumer.service.BusinessService;

@Controller
@RequestMapping("/business")
public class BusinessController {

    @Autowired
    private BusinessService businessService;
        
    @RequestMapping("/")
    public String index() {
      return "index";
    }
    
    @RequestMapping("/businessMain")
    public String businessMain() {
      return "business/businessMain";
    }
    
    // 예약 관리 대쉬보드
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        ArrayList<ReservationVO> reservations = businessService.getAllReservations();
        // Model에 데이터를 추가합니다.
        model.addAttribute("reservations", reservations);
        
        // 대시보드 JSP 페이지를 반환합니다.
        return "business/dashboard";
    }
    
    @GetMapping("/getReservations")
    @ResponseBody
    public ArrayList<ReservationVO> getReservations() {
        return businessService.getAllReservations();
    }

    // 예약 확정
    @PostMapping("/confirmReservation/{resNo}")
    public String confirmReservation(@PathVariable Integer resNo) {
        businessService.confirmReservation(resNo);
        return "redirect:/business/dashboard";
    }

    // 예약 취소
    @PostMapping("/cancelReservation/{resNo}")
    public String cancelReservation(@PathVariable Integer resNo) {
        businessService.cancelReservation(resNo);
        return "redirect:/business/dashboard";
    }
    
    
}
