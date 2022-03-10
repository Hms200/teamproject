package com.ezen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.IreviewDAO;
import com.ezen.dto.Review;

@Service
public class MyPageService {

	@Autowired
	IreviewDAO reviewDAO;
	
	public String getNewReview(Review review) {
		int result = reviewDAO.insertReview(review);
		if(result == 1) {
			return "<script> alert('리뷰등록!')  </script>";
		}else {
			return "<script> alert('리뷰등록실패')  </script>";
		}
	
	}


}
