package com.ezen.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.ezen.security.oauth.ProviderType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@Data
@ToString
public class User {
	
	private int user_idx;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_address;
	private String user_email;
	private Date join_date;
	private String user_provider;
	
	@Builder
	public User(int user_idx, String user_id, String user_pw, String user_name, String user_phone, String user_address,
			String user_email, Date join_date, String user_provider) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_email = user_email;
		this.join_date = join_date;
		this.user_provider = user_provider;
	}
	
	
	
}
