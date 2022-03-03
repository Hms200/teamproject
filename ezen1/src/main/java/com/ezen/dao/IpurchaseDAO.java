package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Purchase;

@Mapper
public interface IpurchaseDAO {

	//해당 idx에 해당하는 모든값가져옴 
	public Purchase getPurchaseInfoByCartListidx(int cart_list_idx);
	
	//해당 idx에 해당하는 값의 starement를 변경
	public int updatePurchaseStatementByMyPage(int purchase_idx,String purchase_statement);
	
	//모든 값을 가져옴
	public ArrayList<Purchase> getPurchaseList();
}
