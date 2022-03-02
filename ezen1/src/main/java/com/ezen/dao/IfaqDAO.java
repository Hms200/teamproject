package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.FaQ;

@Mapper
public interface IfaqDAO {
	public ArrayList<FaQ> getFaqList();
	public ArrayList<FaQ> getFaqListByCat();
	public int FaqWrite();
	public int faqDeleteByFaqIdx();
}
