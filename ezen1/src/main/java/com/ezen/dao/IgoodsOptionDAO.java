package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.GoodsOption;

@Mapper
public interface IgoodsOptionDAO {

	// 옵션테이블의 모든 내용 가져옴
	public ArrayList<GoodsOption> getGoodsOptions();
	
	// 옵션idx로 옵션 가격가져옴
	public int getOptionPrice(int option_idx);
}
