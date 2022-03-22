package com.ezen.security.oauth;

@SuppressWarnings("serial")
public class OAuthProviderMissMatchException extends RuntimeException{

	public OAuthProviderMissMatchException(String message) {
		super(message);
	}
}
