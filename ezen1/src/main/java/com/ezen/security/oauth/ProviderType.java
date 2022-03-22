package com.ezen.security.oauth;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public enum ProviderType {
	// 소셜로그인 제공 회사 추가시 enum추가
	GOOGLE,
	LOCAL;
}
