package com.ezen.dto;

import lombok.Builder;
import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.ToString;

import org.springframework.stereotype.Component;

@Component
@NoArgsConstructor
@Data
@ToString
public class Cart {

	private int cart_idx;
	private int cart_list_idx;
	private int user_idx;
	private int goods_idx;
	private int option_idx;
	private int cart_amount;
	private int cart_total_price;
	private int cart_isdone;
	
	@Builder
	public Cart(int cart_idx, int cart_list_idx, int user_idx, int goods_idx, int option_idx, int cart_amount,
			int cart_total_price, int cart_isdone) {
		super();
		this.cart_idx = cart_idx;
		this.cart_list_idx = cart_list_idx;
		this.user_idx = user_idx;
		this.goods_idx = goods_idx;
		this.option_idx = option_idx;
		this.cart_amount = cart_amount;
		this.cart_total_price = cart_total_price;
		this.cart_isdone = cart_isdone;
	}
	
	
}
