package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.ICartDAO;
import com.spring_boot_final.metasumer.model.CartVO;
import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderInfoVO;
import com.spring_boot_final.metasumer.model.OrderProductVO;
import com.spring_boot_final.metasumer.model.OrderVO;

@Service
public class CartService implements ICartService {
	@Autowired
	@Qualifier("ICartDAO")
	ICartDAO dao;

	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}

	@Override
	public int checkPrdInCart(String prdNo, String memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prdNo", prdNo);
		map.put("memId", memId);
		
		return dao.checkPrdInCart(map);
	}

	@Override
	public void updateQtyInCart(CartVO vo) {
		dao.updateQtyInCart(vo);
	}

	@Override
	public ArrayList<CartVO> cartList(String memId) {
		return dao.cartList(memId);
	}

	@Override
	public void deleteCart(ArrayList<String> chkArr) {
		dao.deleteCart(chkArr);
	}

	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}

	@Override
	public MemberVO getMemberInfo(String memId) {
		return dao.getMemberInfo(memId);
	}

	@Override
	public void insertOrderInfo(OrderInfoVO ordInfoVo) {		
		// (1) 주문 정보 저장
        dao.insertOrderInfo(ordInfoVo);

        // (2) 주문 상품 내용 저장
        HashMap<String, Object> map = new HashMap<>();
        map.put("ordNo", ordInfoVo.getOrdNo());
        map.put("memId", ordInfoVo.getMemId());
        map.put("cartNos", ordInfoVo.getCartNos());
        dao.insertOrderProduct(map);

        // (3) 선택된 상품만 장바구니에서 삭제
        ArrayList<Integer> cartNos = ordInfoVo.getCartNos(); // 주문서에 포함된 cartNo 리스트
        dao.deleteCartAfterOrder(cartNos, ordInfoVo.getMemId());
	}

	@Override
	public void insertOrderProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<CartVO> selectedCartList(ArrayList<Integer> cartNos) {
		return dao.selectedCartList(cartNos);
	}

	@Override
	public void deleteCartAfterOrder(ArrayList<Integer> cartNos, String memId) {
		// TODO Auto-generated method stub
		
	}	

	@Override
	public ArrayList<OrderProductVO> orderListFiltered(String memId, String startDate, String endDate) {
		return dao.orderListFiltered(memId, startDate, endDate);
	}

	@Override
	public void deleteCartItem(String memId, int cartNo) {
		dao.deleteCartItem(memId, cartNo);
		
	}

	@Override
	public void insertOrderInfo2(OrderVO ordVo) {
		// (1) 주문 정보 저장
		dao.insertOrderInfo2(ordVo);
		
		// (2) 주문 상품 내용 저장
        HashMap<String, Object> map = new HashMap<>();
        map.put("ordNo", ordVo.getOrdNo());
        map.put("prdNo", ordVo.getPrdNo()); // 개별 상품 번호
        map.put("ordQty", ordVo.getOrdQty()); // 개별 상품 수량
        map.put("memId", ordVo.getMemId());
        dao.insertOrderProduct2(map); 		
	}

	@Override
	public void insertOrderProduct2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
}
