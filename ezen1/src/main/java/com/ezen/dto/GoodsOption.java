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
public class GoodsOption {

	private int option_idx;
	private String option_name;
	private int option_price;
	
	@Builder
	public GoodsOption(int option_idx, String option_name, int option_price) {
		super();
		this.option_idx = option_idx;
		this.option_name = option_name;
		this.option_price = option_price;
	}
	
	
}
