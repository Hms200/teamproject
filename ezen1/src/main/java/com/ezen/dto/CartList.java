package com.ezen.dto;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@Data
@NoArgsConstructor
@ToString
public class CartList {

	private int cart_list_idx;

	@Builder
	public CartList(int cart_list_idx) {
		super();
		this.cart_list_idx = cart_list_idx;
	}
	
	
}
