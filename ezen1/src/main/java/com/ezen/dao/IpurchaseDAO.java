package com.ezen.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<Purchase> getPurchaseList(int start, int end);
	
	public int countOfPurchase();
	
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
	
	//cart_isdone 리스트 중에 로그인된user_idx를 가지고 mall_purchase의cart_list_idx와 mall_goods의 goods_idx가 둘다 일치하는 상품
	public ArrayList<HashMap<String, String>> getpurchaseArrayList(int user_idx, int cart_list_idx, int goods_idx);

	//넘어온 카테고리 구매내역만 출력
	public ArrayList<HashMap<String, String>> getCartIsDoneAndByCat(int user_idx, String search);
}
