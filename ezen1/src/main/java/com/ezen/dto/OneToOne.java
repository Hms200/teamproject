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
public class OneToOne {

	private int onetoone_idx;
	private int user_idx;
	private String onetoone_cat;
	private String onetoone_title;
	private String onetoone_contents;
	private Date onetoone_date;
	private int onetoone_isreplied;
	private String onetoone_reply;
	private Date onetoone_reply_date;
	
	@Builder
	public OneToOne(int onetoone_idx, int user_idx, String onetoone_cat, String onetoone_title,
			String onetoone_contents, Date onetoone_date, int onetoone_isreplied, String onetoone_reply,
			Date onetoone_reply_date) {
		super();
		this.onetoone_idx = onetoone_idx;
		this.user_idx = user_idx;
		this.onetoone_cat = onetoone_cat;
		this.onetoone_title = onetoone_title;
		this.onetoone_contents = onetoone_contents;
		this.onetoone_date = onetoone_date;
		this.onetoone_isreplied = onetoone_isreplied;
		this.onetoone_reply = onetoone_reply;
		this.onetoone_reply_date = onetoone_reply_date;
	}
	
	
}
