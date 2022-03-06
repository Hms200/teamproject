package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.GoodsOption;

@Mapper
public interface IgoodsOptionDAO {

	// 옵션테이블의 모든 내용 가져옴
	public ArrayList<GoodsOption> getGoodsOptions();
}
