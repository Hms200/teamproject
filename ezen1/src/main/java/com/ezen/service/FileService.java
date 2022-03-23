package com.ezen.service;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

// application.properties에 다음과 같이 추가 해 주세요.
//#File uploade service
//app.goods.img.dir=src/main/resources/static/img/uploadedGoodsImgs
//app.reviews.img.dir=src/main/resources/static/img/uploadedReviewImgs
//app.thumb.img.dir=src/main/resources/static/img/uploadedGoodsThumb
@Service
@Slf4j
public class FileService {

	// 상품이미지 업로드 경로
	@Value("${app.goods.img.dir}")
	private String goodsImgUploadDir;
	
	// 리뷰이미지 업로드 경로
	@Value("${app.reviews.img.dir}")
	private String reviewImgUploadDir;
	
	// thumbnail 이미지 업로드 경로
	@Value("${app.thumb.img.dir}")
	private String thumbImgUploadDir;
	
	// detail 이미지 업로드 경
	@Value("${app.goods.detail.dir}")
	private String detailImgUploadDir;
	
	
	// img cat - goods, reviews, thumb, detail
	// fileUploader를 호출할 때 꼭 어떤 이미지파일인지 cat을 넣어주세요.
	// 업로드에 성공하면 이미지가 저장된 서버상의 경로를 String으로 리턴 
	// 리턴된 이미지 저장경로를 받아서 DB의 img 관련 테이블에 해당 idx와 함께 insert하면 됨.
	// 파일 업로드에 실패했는지 여부는 리턴된 String의 charAt(0) 의 값이 f 이면 실패로 처리.
	public String fileUploader(String cat, MultipartFile multipartFile) throws UnsupportedEncodingException {
		
		if(multipartFile.getOriginalFilename().isEmpty() == true || multipartFile.getOriginalFilename().isBlank() == true) {
			return "f";
		}
		
		String uploadDir;
		if(cat.equals("goods")) {
			uploadDir = goodsImgUploadDir;
		}else if(cat.equals("reviews")) {
			uploadDir = reviewImgUploadDir;
		}else if(cat.equals("thumb")){
			uploadDir = thumbImgUploadDir;
		}else if(cat.equals("detail")){
			uploadDir = detailImgUploadDir;
		}else {
			return "f 잘못된 이미지 카테고리 지정";
		}
		// os에 따른 dir 구문문자 처리
		uploadDir = uploadDir.replace("/", File.separator);
		
		// 파일명 생성기
		String newName = fileNameGenerator(multipartFile.getOriginalFilename());
		
		// 파일 저장 경로 
		// File.separator 는 os마다 다른 경로구분문자를 알아서 넣어줌. cleanPath는 파일명의 지저분한 값들을 다 지워줌
		Path copyLocation = Paths.get(uploadDir + File.separator + StringUtils.cleanPath(newName));
		
		// input stream 으로 파일 가져와서 copyLocation에 저장. 기존에 존재하는 파일이면 replace
		try {
			Files.copy(multipartFile.getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			log.error("{}",e);
			log.info("업로드 실패 파일 : {}", multipartFile.getOriginalFilename());
			return "f 업로드 실패 파일: "+multipartFile.getOriginalFilename();
		}
		// dir 구분문자를 /로 교체
		return copyLocation.toString().replace(File.separator, "/").replace("src/main/resources/static/img/", "/img/");
	}
	
	// 파일명 생성기. 같은 이름의 파일이 업로드되어 덮어쓰기 되는것 방지용
	// original File Name 앞에 난수생성기로 4자리 숫자 생성하여 붙임
	public String fileNameGenerator(String originalFileName) {
		Random random = new Random();
		String randomNum = String.valueOf(random.nextInt(10000));
		originalFileName = originalFileName.replaceAll("-", "_");
		return randomNum + originalFileName;
	}

}
