package com.ezen.service;

import java.util.Random;

import org.springframework.stereotype.Component;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
@NoArgsConstructor
public class DisposablePasswordGenerator {

	// 임시비밀번호 생성기
	public String generateDisposablePassword() {
		log.info("1회용 비밀번호 생성을 시작합니다.");
		Random random = new Random();
		
		String disposablePW = "";
		String characterIndex = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		
		for(int i=0; i<5; i++) {
			int j = random.nextInt(62);
			char k = characterIndex.charAt(j);
			disposablePW += k;
		}
		log.info("비밀번호 생성 완료");
		return disposablePW;
		
	}
}
