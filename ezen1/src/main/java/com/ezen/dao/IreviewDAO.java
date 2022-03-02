package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Review;

@Mapper
public interface IreviewDAO {

	public ArrayList<Review> getReviewList(int goods_idx);
}
