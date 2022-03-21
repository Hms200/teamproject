package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.OneToOne;

@Mapper
public interface IonetooneDAO {
	//MALL_oneToOne에서 등록된 정보를 가져옴.
	public ArrayList<OneToOne> getOneToOneList(int start, int end);
	// 모든 질문리스트 가져옴
	public ArrayList<OneToOne> getAllOneToOneList();
	public int countOfOneToOne();
	//oneToone_idx를 받아서 MALL_onetoone에서 값이 null인 onetoone_reply에 입력받은 내용을 넣어줌. oneToone_isreply값을 true로 변경.
	public int updateQnaAnswerByReplyAndContent(int onetoone_idx, String onetoone_reply);
	//Mall_ONETOONE에서 해당 user_idx를 가진 data를 가져옴.
	public ArrayList<OneToOne> getOnetoOneByUserIdx(int user_idx);
	//Mall_ONETOONE에서 해당 user_idx를 가진 data중에 동일한 onetoone_cat을 가진 data를 가져옴.
	public ArrayList<OneToOne> myOnetoOneByCat(String onetoone_cat);
	//OneToOne을 받아 mall_onetoone에 insert
	public int insertOneToOne(OneToOne onetoone);
}