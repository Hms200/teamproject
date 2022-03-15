package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Purchase;
import com.ezen.dto.User;

@Mapper
public interface IpurchaseDAO {

	//해당 idx에 해당하는 모든값가져옴 
	public Purchase getPurchaseInfoByCartListidx(int cart_list_idx);
	
	//해당 idx에 해당하는 값의 starement를 변경
	public int updatePurchaseStatementByMyPage(int purchase_idx,String purchase_statement);
	
	//모든 값을 가져옴
	public ArrayList<Purchase> getPurchaseList();
	
	//insert purchase
	public int insertPurchase(Purchase purchase);
	
	//purchase_statement 로 해당하는 row 가져옴
	public ArrayList<Purchase> getPurchaseListByStatement(String purchase_statement);
	
	// 최신순으로 정렬된 모든 값을 가져옴
	public ArrayList<Purchase> getPurchaseListDesc();
	
	// 오래된 순으로 정렬된 모든 값을 가져옴
	public ArrayList<Purchase> getPurchaseListAsc();
	
	// purchase 단건 가져옴
	public Purchase getPurchaseByPurchaseIdx(int purchase_idx);
	
	//purchaseList 필요정보 query
	public ArrayList<Purchase> getpurchaseArrayList(int user_idx, int cart_list_idx, int goods_idx);
}
