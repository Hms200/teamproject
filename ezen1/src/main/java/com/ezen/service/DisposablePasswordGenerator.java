package com.ezen.service;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class DisposablePasswordGenerator {

	// 임시비밀번호 생성기
	public String generateDisposablePassword() {
		
		Random random = new Random();
		
		String disposablePW = "";
		
		for(int i=0; i<5; i++) {
			int rnd = random.nextInt(5);
			String rndchar = rnd%2 == 0 ? String.valueOf((char) random.nextInt(100)) : String.valueOf(random.nextInt(10));
			disposablePW.concat(rndchar);	
		}
		
		return disposablePW;
		
	}
}
