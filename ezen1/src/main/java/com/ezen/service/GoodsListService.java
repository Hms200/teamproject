package com.ezen.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IcartDAO;
import com.ezen.dao.IcartListDAO;
import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.IgoodsOptionDAO;
import com.ezen.dao.IpurchaseDAO;
import com.ezen.dao.IreviewIMGSDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Cart;
import com.ezen.dto.Goods;
import com.ezen.dto.GoodsIMGS;
import com.ezen.dto.GoodsOption;
import com.ezen.dto.Purchase;
import com.ezen.dto.Review;
import com.ezen.dto.ReviewIMGS;
import com.ezen.dto.User;

@Service
public class GoodsListService {
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	IgoodsIMGSDAO goodsIMGDAO;
	
	@Autowired
	IgoodsOptionDAO goodsOptionDAO;
	
	@Autowired
	IcartDAO cartDAO;
	
	@Autowired
	IcartListDAO cartListDAO;
	
	@Autowired
	IpurchaseDAO purchaseDAO;
	
	@Autowired
	Pagenation pagenation;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	IuserDAO userDAO;
	
	@Autowired
	IreviewIMGSDAO reviewImgsDAO;
	
	
	// 전체상품 페이지
	public Model goodsList(Model model) {
		ArrayList<Goods> list = goodsDAO.getAllGoodsList();
		model.addAttribute("list", list);
		return model;
	}
	
	// 상품 상세페이지
	public Model goodsDetail(int goods_idx, Model model) {
		Goods goods = goodsDAO.getGoodsInfo(goods_idx);
		ArrayList<Review> reviewList = goodsDAO.getGoodsReview(goods_idx);
		ArrayList<ReviewIMGS> reviewImgList = new ArrayList<>();
		reviewList.forEach(review -> {
			ReviewIMGS reviewImg = reviewImgsDAO.getReviewImgList(review.getReview_idx());
			reviewImgList.add(reviewImg);
		});
		ArrayList<String> goodsImgs = goodsIMGDAO.getGoodsImgs(goods_idx);
		ArrayList<GoodsOption> goodsOptions = goodsOptionDAO.getGoodsOptions();
		model.addAttribute("goods", goods);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewImgList", reviewImgList);
		model.addAttribute("goodsImgs", goodsImgs);
		model.addAttribute("goodsOptions", goodsOptions);
		return model;
	}
	
	// 카트에 상품담기
	public String addGoodsInCart(Cart cart) {
		
		int result = cartDAO.insertCart(cart);
		String resultString;
		if(result == 0) {
			resultString = "false";
		}else if(result == 1) {
			resultString = "true";
		}else {
			resultString = "false";
		}

		return resultString;
	}
	
	// 카트에 담긴 상품불러오기
	public Model getGoodsInCart(int user_idx, Model model) {
		ArrayList<Cart> cartlist = cartDAO.getCartIsNotDone(user_idx);
		ArrayList<Goods> goodslist = new ArrayList<>();
		cartlist.forEach(cart -> {
			Goods goods = goodsDAO.getGoodsInfo(cart.getGoods_idx());
			goodslist.add(goods);
		});
		ArrayList<GoodsOption> optionlist = goodsOptionDAO.getGoodsOptions();
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("goodslist", goodslist);
		model.addAttribute("optionlist", optionlist);
		return model;
	}
	//카트에 담긴 상품 갯수 조회하기
	public int getCountOfGoodsInCart(int user_idx) {
		int count = cartDAO.getNumberOfCartIsNotDone(user_idx);
		return count;
	}
	
	// 카트페이지에서 옵션, 수량 변경
	public void changeValueOfCart(HashMap<String, String> param) {
		int originalPrice = Integer.parseInt(param.get("original_price"));
		int cart_idx = Integer.parseInt(param.get("cart_idx"));
		int cart_amount = Integer.parseInt(param.get("cart_amount"));
		int option_idx = Integer.parseInt(param.get("option_idx"));
		int option_price = goodsOptionDAO.getOptionPrice(option_idx);
		int cart_total_price = (originalPrice+option_price)*cart_amount;
		cartDAO.updateValues(cart_idx, option_idx, cart_amount, cart_total_price);
	}
	// 카트에서 상품 삭제
	public void removeGoodsFromCart(HashMap<String, String> list) {
		list.forEach((k, v) -> {
			if(v.equals("true")) {
				cartDAO.removeGoodsFromCart(Integer.parseInt(k));
				System.out.println(k+"삭제됨");
			}
		});
		int userIdx = (int) session.getAttribute("user_idx");
		int countOfGoodsInCart = cartDAO.getNumberOfCartIsNotDone(userIdx);
		session.setAttribute("cart", countOfGoodsInCart);
	}
	// 카트 개별항목 리스트로 묶기
	public String listingGoods(HashMap<String, String> list) {
		cartListDAO.generateCartListKey();
		int cart_list_idx = cartListDAO.getNewestCartListKey();
		System.out.println(cart_list_idx);
		list.forEach((k,v) ->{
			if(v.equals("true")) {
				cartDAO.listingCart(Integer.parseInt(k), cart_list_idx);
			}
		}); 
		return String.valueOf(cart_list_idx);
	}
	
	// 장바구니 리스트번호로 장바구니항목 가져오기
	public Model getListedGoods(int cart_list_idx, Model model) {
		String userIdx = String.valueOf(session.getAttribute("user_idx"));
		int user_idx = Integer.parseInt(userIdx);
		User user = userDAO.getMemberInfoByUserIdx(user_idx);
		user.setUser_pw("");
		ArrayList<Cart> cartlist = cartDAO.getCartIsListed(cart_list_idx);
		ArrayList<Goods> goodslist = new ArrayList<>();
		cartlist.forEach(cart -> {
			Goods goods = goodsDAO.getGoodsInfo(cart.getGoods_idx());
			goodslist.add(goods);
		});
		ArrayList<GoodsOption> optionlist = goodsOptionDAO.getGoodsOptions();
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("goodslist", goodslist);
		model.addAttribute("optionlist", optionlist);
		model.addAttribute("userinfo", user);
		model.addAttribute("cartlistidx", cart_list_idx);
		return model;
	}
	// 구매 전 비밀번호 확인
	public String checkPw(String pw) {
		String user_id = (String) session.getAttribute("user_id");
		String user_pw = userDAO.getUserPw(user_id);
		if(pw.equals(user_pw)) {
			return "true";
		}else {
			return "false";
		}
	}
	// 구매기록 저장
	public String makePurchase(Purchase purchase) {
		int result = purchaseDAO.insertPurchase(purchase);
		String returnString = result == 1 ? "true" : "false";
		return returnString;
	}
	// cart 항목 구매됨으로 변경
	public void makeCartIsDone(int cart_list_idx) {
		cartDAO.updateCartIsDone(cart_list_idx);
	}
	
	
}
