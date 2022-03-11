package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Cart;

@Mapper
public interface IcartDAO {
	//해당 idx중에 구매여부가 ture인 값을 가져옴
	public ArrayList<Cart> getCartIsDone(int user_idx);
	
	//해당 id중에 구매여부가 false인 값의 갯수를 가져옴
	public int getNumberOfCartIsNotDone(int user_idx);
	
	//해당 idx중에 구매여부가 false인 값을 가져옴
	public ArrayList<Cart> getCartIsNotDone(int user_idx);
	
	//해당 idx를 mall_cart에서 값을 찾아서 cartList_idx에 넣고 구매여부를 0으로 변경
	public Cart updateCartIsDone(int cart_idx, int cart_list_idx);
	
	//입력받은 값으로 카트 정보 추가
	public int insertCart(Cart cart);
	
	//옵션 수량 변경
	public int updateValues(int cart_idx, int option_idx, int cart_amount, int cart_total_price);
	
	//카트에서 상품 삭제
	public int removeGoodsFromCart(int cart_idx);
}
