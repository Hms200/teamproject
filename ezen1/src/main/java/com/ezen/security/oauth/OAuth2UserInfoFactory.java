package com.ezen.security.oauth;

import java.util.Map;

// 소셜 로그인 제공사 추가되면 providerType에 따른 userInfo return 추가
public class OAuth2UserInfoFactory {
	public static OAuth2UserInfo getOAuth2UserInfo(ProviderType providerType, Map<String, Object> attributes) {
		switch (providerType) {
		case GOOGLE: return new GoogleOAuth2UserInfo(attributes);
		default: throw new IllegalArgumentException("잘못된 provider 정보");
		}
	}
}
