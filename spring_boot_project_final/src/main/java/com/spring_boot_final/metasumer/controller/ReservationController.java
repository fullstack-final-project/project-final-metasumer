package com.spring_boot_final.metasumer.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.metasumer.model.BusinessVO;
import com.spring_boot_final.metasumer.model.ReservationVO;
import com.spring_boot_final.metasumer.service.BusinessService;
import com.spring_boot_final.metasumer.service.ReservationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService reservationService;
    @Autowired
    private BusinessService businessService;
        
   
    @RequestMapping("/business/dashboard")
    public String showDashboard(@RequestParam("bizId") int bizId, HttpSession session, Model model) {
        
        // 선택한 사업체의 예약 정보를 가져옴
        List<ReservationVO> reservations = reservationService.getReservationsByBusiness(bizId);
        
        BusinessVO business = businessService.getBusinessByBizId(bizId);
       
        model.addAttribute("business", business);
        model.addAttribute("reservations", reservations);
        model.addAttribute("bizId", bizId);

        return "business/dashboard";
    }
    
    // 모든 예약 정보 조회
    @RequestMapping("/business/listAllReservations")
    public @ResponseBody ArrayList<ReservationVO> listAllReservations() {
        return reservationService.getAllReservations();
    }
    
    @RequestMapping("/business/listReservationsByBizId/{bizId}")
    @ResponseBody
    public List<ReservationVO> listReservationsByBizId(@PathVariable("bizId") int bizId) {
        return reservationService.getReservationsByBusiness(bizId);
    }
    

    // 예약 확정
    @RequestMapping("/business/confirmReservation/{bizId}/{resNo}")
    @ResponseBody
    public void confirmReservation(@PathVariable("bizId") int bizId, @PathVariable("resNo") int resNo) {
        reservationService.confirmReservation(resNo);  // bizId는 쿼리와 관련이 없으므로 사용하지 않음
    }

    @RequestMapping("/business/cancelReservation/{bizId}/{resNo}")
    @ResponseBody
    public void cancelReservation(@PathVariable("bizId") int bizId, @PathVariable("resNo") int resNo) {
        reservationService.cancelReservation(resNo);  // bizId는 쿼리와 관련이 없으므로 사용하지 않음
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
