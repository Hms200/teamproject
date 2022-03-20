package com.ezen.security;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserDetailsServieceImpl implements UserDetailsService{

	@Autowired
	 private final IuserDAO userDAO;

	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		User user = userDAO.getMemberInfo(user_id);
		if(user == null) {
			log.info("해당 id를 찾을 수 없습니다.");
			throw new UsernameNotFoundException(user_id);
		}
		log.info("로그인 인증을 시작합니다.");
		log.info("로그인 시도 id : {}", user.getUser_id());
		
		CustomUserDetails customUserDetails = new CustomUserDetails();
		customUserDetails.setUsername(user.getUser_id());
		customUserDetails.setPassword(user.getUser_pw());
		
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		if(user_id.equals("admin")) {
			grantedAuthorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
			log.info("사용자 권한 : ADMIN");
		}else {
			grantedAuthorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
			log.info("사용자 권한 : MEMBER");
			
		}
		
		customUserDetails.setAuthorities(grantedAuthorities);
		customUserDetails.setEnabled(true);
		customUserDetails.setAccountNonExpired(true);
		customUserDetails.setAccountNonLocked(true);
		customUserDetails.setCredentialsNonExpried(true);
		
		return customUserDetails;
	}
	
	
}
