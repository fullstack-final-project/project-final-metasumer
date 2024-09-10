package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_final.metasumer.model.CartVO;
import com.spring_boot_final.metasumer.model.MemberVO;
import com.spring_boot_final.metasumer.model.OrderInfoVO;
import com.spring_boot_final.metasumer.model.OrderProductVO;
import com.spring_boot_final.metasumer.model.OrderVO;

public interface ICartService {
	// 장바구니
	// 장바구니에 추가
	public void insertCart(CartVO vo);

	// 동일 상품 존재 여부 확인
	public int checkPrdInCart(String prdNo, String memId);

	// 동일 상품이 존재하면 수량만 변경
	public void updateQtyInCart(CartVO vo);

	// 장바구니 조회
	public ArrayList<CartVO> cartList(String memId);

	// 장바구니에서 상품 삭제
	public void deleteCart(ArrayList<String> chkArr);
	
	// 장바구니 수량 변경
	public void updateCart(CartVO vo);
	
	// 장바구니 번호에 따른 삭제
	public void deleteCartItem(String memId, int cartNo);
	
	// 주문서
	// 회원정보에 따른 주문서
	public MemberVO getMemberInfo(String memId);
	
	// 주문 정보 저장
	public void insertOrderInfo(OrderInfoVO ordInfoVo);
	
	// 주문 정보 저장(개별상품)
	public void insertOrderInfo2(OrderVO ordVo);
	
	// 주문 상품 정보 저장
	public void insertOrderProduct(HashMap<String, Object> map);
	
	// 주문 상품 정보 저장(개별상품)
	public void insertOrderProduct2(HashMap<String, Object> map);
	
	// 장바구니에서 선택된 상품 가져오기
	public ArrayList<CartVO> selectedCartList(ArrayList<Integer> cartNos);
	
	// 주문 후 장바구니에서 주문한 선택 상품 삭제
    public void deleteCartAfterOrder(ArrayList<Integer> cartNos, String memId);
    
    // 주문 내역
    // 주문 내역 필터링해서 조회
    public ArrayList<OrderProductVO> orderListFiltered(String memId, String startDate, String endDate);

}
