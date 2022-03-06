package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.ReviewIMGS;

@Mapper
public interface IreviewIMGSDAO {

	// 해당 review_idx를 가진 모든 행의 review_img를 가져옴
	public ArrayList<String> getReviewImgList(int review_idx);
	
	// ReviewIMGS 를 insert
	public int insertReviewImg(ReviewIMGS reviewImgs);
}
