package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.OneToOne;
import com.ezen.dto.Question;

@Mapper
public interface IonetooneDAO {

	//MALL_oneToOne에서 등록된 모든 정보를 가져옴.
	public ArrayList<OneToOne> getOneToOneList(OneToOne oneToOne);
	//oneToone_idx를 받아서 MALL_onetoone에서 값이 null인 onetoone_reply에 입력받은 내용을 넣어줌. oneToone_isreply값을 true로 변경.
	public int updateQnaAnswerByReplyAndContent(int onetoone_idx);
	//Mall_ONETOONE에서 해당 user_idx를 가진 data를 가져옴.
	public ArrayList<OneToOne> getOnetoOneByUserIdx(int user_idx);
	//Question을 받아 mall_onetoone에 insert
	public int insertOneToOne(Question question);
}
