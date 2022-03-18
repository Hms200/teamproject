package com.ezen.config;

import org.apache.catalina.filters.CorsFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

import com.ezen.security.JwtAuthenticationFilter;




@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private JwtAuthenticationFilter jwtAuthenticationFilter;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		// http 시큐리티 빌더
		http.cors()
			.and()
			.csrf()   // 우선 disable
				.disable()
			.httpBasic()   // token인증이므로 basic인증은 disable
				.disable()
			.sessionManagement()  // session기반 아님 선언
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
			.and()
			.authorizeRequests()   // 다음 경로는 인증 안해도 됨
				.antMatchers("/", "/main", "/aboutUs", "/siteMap", "/goodsList/goodsList", "goodsList/goosDetail" ,"/login/**").permitAll()
			.anyRequest()  // 위 경로 외에는 인증 해야 함
				.authenticated();
		// 필터 등록. 매 요청마다 CorsFilter 실행한 후 jwtAuthenticationFilter를 실행함.
		http.addFilterAfter(jwtAuthenticationFilter, CorsFilter.class);
	}
	
	
	
}
