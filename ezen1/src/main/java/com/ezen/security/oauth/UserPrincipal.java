package com.ezen.security.oauth;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.yaml.snakeyaml.util.EnumUtils;

import com.ezen.dto.User;
import com.ezen.security.Role;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
@SuppressWarnings("serial")
@Slf4j
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
public class UserPrincipal implements OAuth2User, UserDetails, OidcUser{

	private final String userId;
	private final String password;
	private final ProviderType providerType;
	private final Role role;
	private final Collection<GrantedAuthority> authorities;
	private Map<String, Object> attributes;
	@Override
	public String getName() {
		return userId;
	}
	@Override
	public Map<String, Object> getClaims() {
		return null;
	}
	@Override
	public OidcUserInfo getUserInfo() {
		return null;
	}
	@Override
	public OidcIdToken getIdToken() {
		return null;
	}
	@Override
	public String getUsername() {
		return userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	public static UserPrincipal create(User user) {
		log.info("Oauth2 userprincipal 생성");
		log.info("{}", user.toString());
		return new UserPrincipal(
				user.getUser_id(),
				user.getUser_pw(),
				 ProviderType.valueOf(user.getUser_provider().replace("ProviderType.", "")),
				Role.MEMBER,
				Collections.singletonList(new SimpleGrantedAuthority(Role.MEMBER.getValue())));
	}
	
	public static UserPrincipal create(User user, Map<String, Object> attributes) {
		log.info("UserPrincipal에 provider에서 공받은 사용자정보를 등록합니다.");
		UserPrincipal userPrincipal = create(user);
		userPrincipal.setAttributes(attributes);
		
		return userPrincipal;
	}

	
}
