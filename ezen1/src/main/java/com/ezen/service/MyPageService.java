package com.ezen.service;

import java.io.Console;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IcartDAO;
import com.ezen.dao.IcartListDAO;
import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IpurchaseDAO;
import com.ezen.dao.IreviewDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Cart;
import com.ezen.dto.Purchase;
import com.ezen.dto.Review;
import com.ezen.dto.User;

@Service
public class MyPageService {

	@Autowired
	IreviewDAO reviewDAO;
	@Autowired
	IuserDAO userDAO;
	@Autowired
	IcartDAO cartDAO;
	@Autowired
	IgoodsDAO goodsDAO;
	@Autowired
	IcartListDAO cartListDAO;
	@Autowired
	IpurchaseDAO purchaseDAO;
	
	public String getNewReview(Review review) {
		int result = reviewDAO.insertReview(review);
		if(result == 1) {
			return "<script> alert('리뷰등록!')  </script>";
		}else {
			return "<script> alert('리뷰등록실패')  </script>";
		}
	
	}

	public String updateUserInfo(User user) {
		int result = userDAO.UpdateMemberInfo(user);
		System.out.println(result);
		if(result==1) {
			return "<script>alert('회원정보가 변경되었습니다.');location.href='/main';</script>";
		}else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}
	}

	public ArrayList<Model> purchaseList(String user_id) {
		int user_idx = userDAO.getUserIdx(user_id);
		ArrayList<Cart> isDoneList = cartDAO.getCartIsDone(user_idx);
		
		//인덱스마다 db에서 데이터를 가져와야함
		for(int i=0;i<isDoneList.size();i++) {
			int goods_idx = isDoneList.get(i).getGoods_idx();
			String Thumb = goodsDAO.getGoodsThumb(goods_idx);
			String name = goodsDAO.getGoodsName(goods_idx);
			int cart_idx = isDoneList.get(i).getCart_idx();
			
			int cartList_idx = cartListDAO.getCartListidx(cart_idx);
			//Purchase purchase = purchaseDAO.getPurchaseInfoByCartListidx(cart_idx);
			//System.out.println(purchase);
		}
		return null;
	}


}
