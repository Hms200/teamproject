package com.ezen.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Cart;

@Mapper
public interface IcartDAO {
	//해당 idx중에 구매여부가 true인 값을 가져옴
	public ArrayList<Cart> getCartIsDone(int user_idx);
	
	//해당 id중에 구매여부가 false인 값의 갯수를 가져옴
	public int getNumberOfCartIsNotDone(int user_idx);
	
	//해당 idx중에 구매여부가 false인 값을 가져옴
	public ArrayList<Cart> getCartIsNotDone(int user_idx);
	
	//해당 idx를 mall_cart에서 값을 찾아서 cart_List_idx를 추가
	public int listingCart(int cart_idx, int cart_list_idx);
	
	//입력받은 값으로 카트 정보 추가
	public int insertCart(Cart cart);
	
	//옵션 수량 변경
	public int updateValues(int cart_idx, int option_idx, int cart_amount, int cart_total_price);
	
	//카트에서 상품 삭제
	public int removeGoodsFromCart(int cart_idx);
	
	// 해당 cart_list_idx를 가진 cart 를 받아옴
	public ArrayList<Cart> getCartIsListed(int cart_list_idx);
	
	// 해당 cart_list_idx를 가진 cart의 isdone을 1로 변경
	public int updateCartIsDone(int cart_list_idx);
	
	
	// mall_user와 조인하여 아이디 이름 가입일자를 구함
	public ArrayList<HashMap<String, String>> getCartSumOfPriceAndAmount();
	
	// 해당 user_idx를 가진 cart 의 isdone이 1인 항목들의 cart_amount, cart_total_price의 합,
	public HashMap<String, String> getCartSumOfPriceAndAmountByUserIdx(int user_idx);

}
