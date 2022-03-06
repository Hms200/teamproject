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
public class FaQ {

	private int faq_idx;
	private String faq_title;
	private String faq_contents;
	private String faq_cat;
	
	@Builder
	public FaQ(int faq_idx, String faq_title, String faq_content, String faq_cat) {
		super();
		this.faq_idx = faq_idx;
		this.faq_title = faq_title;
		this.faq_contents = faq_contents;
		this.faq_cat = faq_cat;
	}
	
	
}
