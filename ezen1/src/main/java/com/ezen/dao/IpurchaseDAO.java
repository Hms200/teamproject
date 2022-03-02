package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Purchase;

@Mapper
public interface IpurchaseDAO {

	public Purchase getPurchaseInfoByCartListidx(int cartlist_idx);
	
	public int updatePurchaseStatementByMyPage(int purchase_idx,String purchase_statemnet);
	
	public ArrayList<Purchase> getPurchaseList();
}
