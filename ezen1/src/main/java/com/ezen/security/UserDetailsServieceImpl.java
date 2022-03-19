package com.ezen.security;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserDetailsServieceImpl implements UserDetailsService{

	@Autowired
	private final IuserDAO userDAO;

	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		User user = userDAO.getMemberInfo(user_id);
		if(user == null) {
			throw new UsernameNotFoundException(user_id);
		}
		System.out.println("로그인인증을 시작합니다.");
		System.out.println("로그인 시도 id : " + user.getUser_id());
		
		CustomUserDetails customUserDetails = new CustomUserDetails();
		customUserDetails.setUsername(user.getUser_id());
		customUserDetails.setPassword(user.getUser_pw());
		
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		if(user_id.equals("admin")) {
			grantedAuthorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
		}else {
			grantedAuthorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
		}
		
		customUserDetails.setAuthorities(grantedAuthorities);
		customUserDetails.setEnabled(true);
		customUserDetails.setAccountNonExpired(true);
		customUserDetails.setAccountNonLocked(true);
		customUserDetails.setCredentialsNonExpried(true);
		System.out.println("userDetaiilService종료");
		
		return customUserDetails;
	}
	
	
}
