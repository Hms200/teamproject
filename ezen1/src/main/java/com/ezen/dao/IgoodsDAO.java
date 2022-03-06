package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Goods;

@Mapper
public interface IgoodsDAO {

	// 썸네일 가져오기
	public String getGoodsThumb(int goods_idx);
	
	// 상품명 가져오기
	public String getGoodsName(int goods_idx);
	
	// 해당 검색어를 포함하는 모든 상품 정보 가져오기
	public ArrayList<Goods> getGoodsListBySearch(String searchKeyword);
	
	// 해당 카테고리를 가진 모든 상품정보 가져오기
	public ArrayList<Goods> getGoodsListByCat(String cat);
	
	// 해당 이벤트를 시행중인 모든 상품정보 가져오기
	public ArrayList<Goods> getGoodsListByOnEvent(String onEvent);
	
	// 등록된 모든 상품 정보 가져오기


	public ArrayList<Goods> getGoodsList(int start, int end);
	// 해당 goods_idx를 가진 상품 정보 가져오기
	public Goods getGoodsInfo(int goods_idx);
	
	// 전체 상품 갯수 가져오기
	public int countOfGoods();
	
	// 상품 신규 등록 
	public int insertGoods(Goods goods);
	
	// 가장 최근 등록한 상품의 goods_idx가져오기 (mybatis에서 자동증가 시퀀스를 가진 row가 insert되면 insert후 증가된 시퀀스값을 리턴하는 기능이 있어서 수정 고려
	public int getNewestGoodsIdx();
	
	// 해당 goods_idx를 가진 상품의 onEvent 값 변경
	public int updateEvent(int goods_idx, int onEvent);
	
	// 해당 goods_idx를 가진 상품의 판매중 정보를 품절로 변경
	public int updateGoodsStockSoldOut(int goods_idx);
	
	// 해당 goods_idx를 가진 상품의 재고량에 입력받은 수 만큼 더함.
	public int updateGoodsStockOrder(int stock);
	
	// 해당 goods_idx를 가진 상품의 goods_purchased를 증가시킴
	public int updatePurchased(int goods_idx, int cart_amount);
	
	// 해당 goods_idx를 가진 상품을 db에서 삭제
	public int deleteGoods(int goods_idx);
	

	
}
