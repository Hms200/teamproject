package com.ezen.security.oauth;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService{

	@Autowired
	IuserDAO userDAO;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2User user = super.loadUser(userRequest);
		log.info("사용자 정보를 불러옵니다.");
		try {
			return this.process(userRequest, user);
		} catch (AuthenticationException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalAuthenticationServiceException(e.getMessage(), e.getCause());
		}
		
	}
	
	private OAuth2User process(OAuth2UserRequest userRequest, OAuth2User user) {
		ProviderType providerType = ProviderType.valueOf(userRequest.getClientRegistration().getRegistrationId().toUpperCase());
		
		OAuth2UserInfo userInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(providerType, user.getAttributes());
		log.info("db에서 사용자 정보를 조회합니다.");
		User savedUser = userDAO.getMemberInfo(userInfo.getId());
		
		if(savedUser != null) {
			if(!providerType.toString().equals(savedUser.getUser_provider())) {
				throw new OAuthProviderMissMatchException(
						"provider miss match! 로그인 시도 provider :" + providerType + ", 지정된 provider :" + savedUser.getUser_provider()
						);
				
			}
			log.info("기존 사용자의 로그인 시도. 사용자 정보를 업데이트합니다.");
			updateUser(savedUser, userInfo);
		}else {
			log.info("새로운 사용자의 로그인 시도. 새 사용자를 등록합니다.");
			savedUser = createUser(userInfo, providerType);
		}
		
		return UserPrincipal.create(savedUser, user.getAttributes());
	}
	
	private User createUser(OAuth2UserInfo userInfo, ProviderType providerType) {
		User user = User.builder()
					.user_id(userInfo.getId())
					.user_pw("$2a$10$c0lfMtgmpE/ZygYKT9FNE.9CNqAdVhBVA1cFn8ifcEsaOi8KhCJBm")
					.user_name(userInfo.getName())
					.user_email(userInfo.getEmail())
					.user_provider(providerType.toString())
					.build();
		userDAO.insertUserLoginedByOAuth(user);
		return user;
	}
	
	private User updateUser(User user, OAuth2UserInfo userInfo) {
		if(userInfo.getName() != null && !user.getUser_name().equals(userInfo.getName())) {
			user.setUser_name(userInfo.getName());
		}
		return user;
	}
}
