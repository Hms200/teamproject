package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Question;

@Mapper
public interface IquestionDAO {
	//goods_idx를 받아 MALL_QUESTION에서 해당 idx를 가진 모든 data 가져옴
	public ArrayList<Question> getQuestionList(int goods_idx);
	//Question을 받아 MALL_QUESTION에 insert
	public int insertQna(Question question);
}
