package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Review;

@Mapper
public interface IreviewDAO {
	//goods_idx를 받아 MALL_REVIEW에서 해당 idx를 가진 모든 data를 가져옴.
	public ArrayList<Review> getReviewList(int goods_idx);
	
	//review insert
	public int insertReview(Review review);
	
	// 모든 리뷰 가져옴
	public ArrayList<Review> getAllReviews();
	
	// 리뷰 답글달기
	public int updateReviewReply(int review_idx, String review_reply);
	
	//가장 최근에 등록된 review_idx를 가져옴
	public int getNewestReviewIdx();
}