package com.ezen.dto;

import org.springframework.stereotype.Component;
import java.sql.Date;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@Data
@ToString
public class Notice {

	private int notice_idx;
	private String notice_title;
	private String notice_contents;
	private int notice_show;
	private Date notice_date;
	
	@Builder
	public Notice(int notice_idx, String notice_title, String notice_contents, int notice_show, Date notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_show = notice_show;
		this.notice_date = notice_date;
	}
	
	
}
