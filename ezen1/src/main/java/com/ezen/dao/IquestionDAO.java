package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Question;

@Mapper
public interface IquestionDAO {
	public ArrayList<Question> getQuestionList();
	public int insertQna();
}
