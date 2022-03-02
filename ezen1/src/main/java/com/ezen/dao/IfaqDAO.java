package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.FaQ;

@Mapper
public interface IfaqDAO {
	//MALL_FAQ에 모든 정보를 가져옴
	public ArrayList<FaQ> getFaqList();
	//MALL_FAQ에서 해당 카테고리의 모든 data 가져옴
	public ArrayList<FaQ> getFaqListByCat(String faq_cat);
	//Faq를 받아 MALL_FAQ에 insert
	public int FaqWrite(FaQ faq);
	//받은 faq_idx와 MALL_FAQ에서 동일한 faq_idx를 가진 data를 delete
	public int faqDeleteByFaqIdx(int faq_idx);
}
