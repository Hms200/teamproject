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
public class GoodsIMGS {

	private int goods_idx;
	private String goods_img;
	
	@Builder
	public GoodsIMGS(int goods_idx, String goods_img) {
		super();
		this.goods_idx = goods_idx;
		this.goods_img = goods_img;
	}
	
	
}
