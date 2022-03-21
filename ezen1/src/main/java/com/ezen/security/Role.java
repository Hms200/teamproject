package com.ezen.security;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Role {

	// 유저 권한
	MEMBER("ROLE_MEMBER"),
	ADMIN("ROLE_ADMIN");
	
	private String value;
	
}
