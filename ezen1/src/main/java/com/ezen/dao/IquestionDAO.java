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
	//question_idx를 받아 MALL_QUESTION에서 값이 null인 question_reply에 입력받은 내용을 넣어줌. question_isreply값을 true로 변경.
	public int updateQnaAnswer(int question_idx, String question_reply);
	
	//등록된 모든 질문 가져오기
	public ArrayList<Question> getAllQuestions(int start, int end);
	
	public int countOfQuestions();
}
