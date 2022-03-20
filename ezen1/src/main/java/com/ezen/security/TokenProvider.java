package com.ezen.security;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import org.springframework.stereotype.Service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class TokenProvider {

	private static final String SECRET_KEY = "bm93b25lemVuMQ==";
	
	public String create(String user_idx) {
		System.out.println("토큰생성");
		// 토큰 유효기간은 발급 후 1시간
		Date expiryDate = Date.from(Instant.now().plus(1, ChronoUnit.HOURS));
		
		return Jwts.builder()
				// 토큰 해더. SECRET_KEY로 서명
				.signWith(SignatureAlgorithm.HS512, SECRET_KEY)
				// payload에 들어갈 내용
				.setSubject(user_idx)  // sub
				.setIssuer("SHH Site") // iss
				.setIssuedAt(new Date()) // iat
				.setExpiration(expiryDate) // exp
				.compact();
	}
	
	public String validateAndGetUserIdx(String token) {
		// 위조되지 않았다면 페이로드(claims)리턴, 위조라면 예외날림
		// getbody로 useridx 가져옴
		Claims claims = Jwts.parser()
				.setSigningKey(SECRET_KEY)
				.parseClaimsJws(token)
				.getBody();
		
		return claims.getSubject();
	}
	
}
