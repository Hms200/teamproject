package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IreviewIMGSDAO {

	// 해당 review_idx를 가진 모든 행의 review_img를 가져옴
	public ArrayList<String> getReviewImgList(int review_idx);
}
