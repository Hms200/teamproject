package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Cart;

@Mapper
public interface IcartDAO {

	public ArrayList<Cart> getCartIsDone(int user_idx);
	
	public int getNumberOfCartIsNotDone(int user_idx);
	
	public ArrayList<Cart> getCartIsNotDone(int user_idx);
	
	public Cart updateCartIsDone(int cart_idx);
	
	public int insertCart(Cart cartDTO);
}
