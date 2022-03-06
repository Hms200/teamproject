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
public class Question {

	private int question_idx;
	private int user_idx;
	private int goods_idx;
	private String question_title;
	private String question_contents;
	private Date question_date;
	private int question_isreplied;
	private String question_reply;
	private Date question_reply_date;
	
	@Builder
	public Question(int question_idx, int user_idx, int goods_idx, String question_title, String question_contents,
			Date question_date, int question_isreplied, String question_reply, Date question_reply_date) {
		super();
		this.question_idx = question_idx;
		this.user_idx = user_idx;
		this.goods_idx = goods_idx;
		this.question_title = question_title;
		this.question_contents = question_contents;
		this.question_date = question_date;
		this.question_isreplied = question_isreplied;
		this.question_reply = question_reply;
		this.question_reply_date = question_reply_date;
	}
	
	
}
