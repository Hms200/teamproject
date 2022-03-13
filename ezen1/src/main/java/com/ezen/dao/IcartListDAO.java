package com.ezen.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IcartListDAO {

	//해당 카트 리스트의 번호를 가져옴
	public String getCartListidx(int cart_idx);
	
	//카트 리스트키 생성
	public int generateCartListKey();
	
	//최신 카트리스트 키 가져오기
	public int getNewestCartListKey();
}
