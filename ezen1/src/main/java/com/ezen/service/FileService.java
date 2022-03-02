package com.ezen.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

// application.properties에 다음과 같이 추가 해 주세요.
//#File uploade service
//app.goods.img.dir=/src/main/resources/static/img/uploadedGoodsImgs
//app.reviews.img.dir=/src/main/resources/static/img/uploadedReviewImgs
//app.thumb.img.dir=/src/main/resources/static/img/uploadedGoodsThumb
@Service
public class FileService {

	// 상품이미지 업로드 경로
	@Value("{app.goods.img.dir}")
	private String goodsImgUploadDir;
	
	// 리뷰이미지 업로드 경로
	@Value("{app.reviews.img.dir}")
	private String reviewImgUploadDir;
	
	// thumbnail 이미지 업로드 경로
	@Value("{app.thumb.img.dir}")
	private String thumbImgUploadDir;
	
	
	// img cat - goods, reviews, thumb
	// fileUploader를 호출할 때 꼭 어떤 이미지파일인지 cat을 넣어주세요.
	// 업로드에 성공하면 이미지가 저장된 서버상의 경로를 String으로 리턴 
	// 리턴된 이미지 저장경로를 받아서 DB의 img 관련 테이블에 해당 idx와 함께 insert하면 됨.
	// 파일 업로드에 실패했는지 여부는 리턴된 String의 charAt(0) 의 값이 f 이면 실패로 처리.
	public String fileUploader(String cat, MultipartFile multipartFile) {
		
		String uploadDir;
		if(cat.equals("goods")) {
			uploadDir = goodsImgUploadDir;
		}else if(cat.equals("reviews")) {
			uploadDir = reviewImgUploadDir;
		}else if(cat.equals("thumb")){
			uploadDir = thumbImgUploadDir;
		}else {
			return "f 잘못된 경로 지정";
		}
		
		// 파일 저장 경로 
		Path copyLoacation = Paths.get(uploadDir + File.separator + StringUtils.cleanPath(multipartFile.getOriginalFilename()));
		
		// input stream 으로 파일 가져와서 copyLoacation에 저장. 기존에 존재하는 파일이면 replace
		try {
			Files.copy(multipartFile.getInputStream(), copyLoacation, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("업로드 실패 파일: " + multipartFile.getOriginalFilename());
			return "f 업로드 실패 파일: "+multipartFile.getOriginalFilename();
		}
		return copyLoacation.toString();
	}

}
