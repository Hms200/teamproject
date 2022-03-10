package com.ezen.dto;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@Data
@ToString
public class Goods {

	private int goods_idx;
	private String goods_name;
	private int goods_price;
	private String goods_thumb;
	private String goods_cat;
	private int goods_stock;
	private int goods_onevent;
	private int goods_purchased;
	private String goods_detail;
	private int goods_onsale;
	
	@Builder
	public Goods(int goods_idx, String goods_name, int goods_price, String goods_thumb, String goods_cat,
			int goods_stock, int goods_onevent, int goods_purchased, String goods_detail, int goods_onsale) {
		super();
		this.goods_idx = goods_idx;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_thumb = goods_thumb;
		this.goods_cat = goods_cat;
		this.goods_stock = goods_stock;
		this.goods_onevent = goods_onevent;
		this.goods_purchased = goods_purchased;
		this.goods_detail = goods_detail;
		this.goods_onsale = goods_onsale;
	}
	
	
}
