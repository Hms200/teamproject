package com.ezen.security.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	IuserDAO userDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDAO.getMemberInfo(username);
		if(user == null) {
			log.info("해당 id를 찾을 수 없습니다.");
			throw new UsernameNotFoundException(username);
		}
		return UserPrincipal.create(user);
	}
	
	
}
