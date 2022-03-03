package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IgoodsIMGSDAO {

	// 해당 goods_idx를 가진 모든 행의 goods_img를 가져옴
	public ArrayList<String> getGoodsImgs(int goods_idx);
	
	// 해당 goods_idx를 가진 행에 Img 저장 경로를 insert
	public int insertGoodsImgs(int goods_idx);
}
