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
public class ReviewIMGS {

	 private int review_idx;
	 private String review_img;
	 
	 @Builder
	public ReviewIMGS(int review_idx, String review_img) {
		super();
		this.review_idx = review_idx;
		this.review_img = review_img;
	}
	 
	 
}
