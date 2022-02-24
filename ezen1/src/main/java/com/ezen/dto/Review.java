package com.ezen.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@Data
@ToString
public class Review {

	private int review_idx;
	private int user_dix;
	private int goods_idx;
	private String review_contents;
	private int review_star;
	private int review_isreplied;
	private String review_reply;
	private Date review_date;
	private Date review_reply_date;
	
	@Builder
	public Review(int review_idx, int user_dix, int goods_idx, String review_contents, int review_star,
			int review_isreplied, String review_reply, Date review_date, Date review_reply_date) {
		super();
		this.review_idx = review_idx;
		this.user_dix = user_dix;
		this.goods_idx = goods_idx;
		this.review_contents = review_contents;
		this.review_star = review_star;
		this.review_isreplied = review_isreplied;
		this.review_reply = review_reply;
		this.review_date = review_date;
		this.review_reply_date = review_reply_date;
	}
	
	
}
