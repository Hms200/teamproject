package com.ezen.service;



import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.ezen.dao.IcartDAO;
import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.IgoodsOptionDAO;
import com.ezen.dao.IonetooneDAO;
import com.ezen.dao.IpurchaseDAO;
import com.ezen.dao.IquestionDAO;
import com.ezen.dao.IreviewDAO;
import com.ezen.dao.IreviewIMGSDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Cart;
import com.ezen.dto.Goods;
import com.ezen.dto.GoodsOption;
import com.ezen.dto.OneToOne;
import com.ezen.dto.Purchase;
import com.ezen.dto.Question;
import com.ezen.dto.Review;
import com.ezen.dto.ReviewIMGS;
import com.ezen.dto.User;



@Service
public class AdminService {

	@Autowired
	IuserDAO userDAO;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	IgoodsIMGSDAO goodsImgDAO;
	
	@Autowired
	Pagenation pagenation;
	
	@Autowired
	IpurchaseDAO purchaseDAO;
	
	@Autowired
	IcartDAO cartDAO;
	
	@Autowired
	IgoodsOptionDAO optionDAO;
	
	@Autowired
	IreviewDAO reviewDAO;
	
	@Autowired
	IreviewIMGSDAO reviewImgsDAO;
	
	@Autowired
	IquestionDAO questionDAO;
	
	@Autowired
	IonetooneDAO onetooneDAO;
	
	//// MemberList filter
	// ID로 검색
	public Model userListBySearch(String searchText, Model model) {
		ArrayList<HashMap<String, String>> rawList = cartDAO.getCartSumOfPriceAndAmount();
		ArrayList<HashMap<String, String>> filtterd = new ArrayList<>();
		rawList.forEach(user -> {
			if(user.get("USER_ID").contains(searchText)) {
				filtterd.add(user);
			}
		});
		model.addAttribute("userlist", filtterd);
		return model;	
	}
	// 그 외 검색
	public Model userListbyFiltter(String cat, Model model) {
		// 1. 구매량 2.금액 3.가입일
		ArrayList<HashMap<String, String>> userList = cartDAO.getCartSumOfPriceAndAmount();
		if(cat.equals("1")) {
			Comparator<HashMap<String, String>> comparator = (o1, o2) -> {
				//내림차순
				int amount1;
				int amount2;
				try {
					amount1 = Integer.parseInt(String.valueOf(o1.get("TOTAL_AMOUNT")));
				} catch (Exception e) {
					amount1= 0;
				}
				try {
					amount2 = Integer.parseInt(String.valueOf(o2.get("TOTAL_AMOUNT")));
				} catch (Exception e) {
					amount2 = 0;
				}
				
				return amount2 - amount1;
			};
			Collections.sort(userList, comparator);
			model.addAttribute("userlist", userList);
		}else if(cat.equals("2")) {
			Comparator<HashMap<String, String>> comparator = (o1, o2) -> {
				//내림차순
				int price1;
				int price2;
				try {
					price1 = Integer.parseInt(String.valueOf(o1.get("TOTAL_PRICE")));
				} catch (Exception e) {
					price1 = 0;
				}
				try {
					price2 = Integer.parseInt(String.valueOf(o2.get("TOTAL_PRICE")));
				} catch (Exception e) {
					price2 = 0;
				}
				return price2 - price1;
			};
			Collections.sort(userList, comparator);
			model.addAttribute("userlist", userList);
		}else {
			Comparator<HashMap<String, String>> comparator = (o1, o2) -> {
				DateTimeFormatter fmt = DateTimeFormatter.ofPattern("uuuu-MM-dd'T'HH:mm:ss.S");
				//내림차순
				LocalDate date1 = LocalDate.parse(String.valueOf(o1.get("JOIN_DATE")).replace(" ", "T"),fmt);
				LocalDate date2 = LocalDate.parse(String.valueOf(o2.get("JOIN_DATE")).replace(" ", "T"),fmt);
				return date2.compareTo(date1);
			};
			Collections.sort(userList, comparator);
			model.addAttribute("userlist", userList);
		}
		return model;
	}

	// 회원관리 유저리스트 받기
	public Model getUserListForAdmin(Model model) {
		ArrayList<HashMap<String, String>> userList = cartDAO.getCartSumOfPriceAndAmount();
		model.addAttribute("userlist", userList);
		return model;
	}
	
	// 회원정보 단건받기
	public Model getUserInfo(int user_idx, Model model) {
		User userInfo = userDAO.getMemberInfoByUserIdx(user_idx);
		model.addAttribute("user", userInfo);
		return model;
	}
	
	// goods page 상품등록	
	public String insertGoods(Goods goods) {
		
		int result = goodsDAO.insertGoods(goods);
		String resultString;
		if(result == 1) {
			int idx = goodsDAO.getNewestGoodsIdx();
			resultString = String.valueOf(idx);
			System.out.println(resultString);
			return resultString;
		}else {
			resultString = "false";
			return resultString;
		}
	}
	
	// stock page
	public Model getGoodsList(String currentPage, Model model) {
		// pagenation 설정
		int countOfGoods = goodsDAO.countOfGoods();
		int numberOfGoodsOnCard = 8;
		int numberOfPagenation = 5;
		
		pagenation = pagenation.pagenation(currentPage, countOfGoods, numberOfGoodsOnCard, numberOfPagenation);
		
		ArrayList<Goods> goodsList = goodsDAO.getGoodsList(pagenation.getStartNumOfRow(), pagenation.getEndNumOfRow());
		model.addAttribute("goodslist", goodsList);
		model.addAttribute("page", pagenation);
		return model;
	}
	// stock page& eventConfig 상단 검색
	public Model stockSearch(String searchText, String search_cat, Model model) {
		if(search_cat.equals("goods_name")) {
			ArrayList<Goods> goodsList = goodsDAO.getGoodsListBySearch(searchText);
			model.addAttribute("goodslist", goodsList);
			return model;
		}else {
			ArrayList<Goods> allGoodsList = goodsDAO.getAllGoodsList();
			ArrayList<Goods> goodsList = new ArrayList<>();
			if(search_cat.equals("goods_onsale=1")) {
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_onsale() == 1) {
						goodsList.add(goods);
					}
				});
			}else if(search_cat.equals("goods_onsale=0")) {
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_onsale() == 0) {
						goodsList.add(goods);
					}
				});
			}else if(search_cat.equals("goods_cat")) {
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_cat().equals(searchText)) {
						goodsList.add(goods);
					}
				});
			}else if(search_cat.equals("goods_onevent")) {
				int eventCode;
				if(searchText.contains("할인")){
					eventCode = 1;
				}else if(searchText.contains("추천")) {
					eventCode = 2;
				}else if(searchText.contains("이벤트") || searchText.contains("event")) {
					eventCode = 3;
				}else {
					eventCode = 0;
				}
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_onevent() == eventCode) {
						goodsList.add(goods);
					}
				});
			}
			model.addAttribute("goodslist", goodsList);
			return model;
		}
	  	 
	}
	// stock 품절처리
	public void makeGoodsSoldOut(HashMap<String, Boolean> list) {
		list.forEach((k,v) -> { 
			if(v == true) {
				int result = goodsDAO.updateGoodsStockSoldOut(Integer.parseInt(k));
				System.out.println(result);
				}
		});
	}
	// stock 상품 삭제
	public void deleteGoodsOnDB(HashMap<String, String> list) {
		list.forEach((k,v) -> {
			if(v.equals("on")) {
				int result = goodsDAO.deleteGoods(Integer.parseInt(k));
				System.out.println("goods_idx : " + k +" : result - " + String.valueOf(result));
			}
		});
	}
	// stock 상품 발주 = amount에 추가 + onsale 1로 변경
	public void orderGoods(HashMap<String, String> list) {
		int amount = Integer.parseInt(list.get("amount"));
		System.out.println(amount);
		list.remove("amount");
		list.forEach((k,v) -> {
			if(v.equals("true")) {
				goodsDAO.updateGoodsStockOrder(Integer.parseInt(k), amount);
				goodsDAO.updateGoodsStockOnSale(Integer.parseInt(k));
			}
		});
	}
	
	// eventConfig 할인상품등록
	public void registerEventDiscount(HashMap<String, String> list) {
		
		list.forEach((k,v) ->{
			if(v.equals("on")) {
				goodsDAO.updateEvent(Integer.parseInt(k), 1);
			}
		});
	}
	
	// eventConfig 이벤트진행중 상품등록
	public void registerEventEvent(HashMap<String, String> list) {
		list.forEach((k,v) -> {
			if(v.equals("on")) {
				goodsDAO.updateEvent(Integer.parseInt(k), 3);
			}
		});
	}
	// eventConfig 추천상품 등록
	public void registerEventRecommend(HashMap<String, String> list) {
		list.forEach((k,v) -> {
			if(v.equals("on")) {
				goodsDAO.updateEvent(Integer.parseInt(k), 2);
			}
		});
	}
	// transaction 페이지 구매목록 불러오기
	public Model transaction(Model model) {
		ArrayList<Purchase> list = purchaseDAO.getPurchaseList();
		HashMap<Integer, String> userlist = new HashMap<>();
		list.forEach(item -> {
			userlist.put(item.getUser_idx(), userDAO.getUserIdByUserIdx(item.getUser_idx()));
		});
		model.addAttribute("purchaselist", list);
		model.addAttribute("userlist", userlist);
		return model;
	}
	
	// transaction 페이지 상단필터
	public Model transactionFiltered(String statement, Model model) {
		ArrayList<Purchase> filteredList = new ArrayList<>();
		HashMap<Integer, String> userlist = new HashMap<>();
		if(statement.equals("최신순")) {
			filteredList = purchaseDAO.getPurchaseListDesc();
			}else if(statement.equals("오래된순")) {
				filteredList = purchaseDAO.getPurchaseListAsc();
			}else {
			filteredList = purchaseDAO.getPurchaseListByStatement(statement);
		}
		filteredList.forEach(item -> {
			userlist.put(item.getUser_idx(), userDAO.getUserIdByUserIdx(item.getUser_idx()));
		});
		model.addAttribute("purchaselist", filteredList);
		model.addAttribute("userlist", userlist);
		return model;
	}
	
	// 주문목록 상세페이지
	public Model transactionDetail(int puarchase_idx, Model model) {
		Purchase purchase = purchaseDAO.getPurchaseByPurchaseIdx(puarchase_idx);
		int cart_idx = purchase.getCart_list_idx();
		ArrayList<Cart> cartList = cartDAO.getCartIsListed(cart_idx);
		ArrayList<Goods> goodsList = new ArrayList<>();
		cartList.forEach(item -> {
			goodsList.add(goodsDAO.getGoodsInfo(item.getGoods_idx()));
		});
		ArrayList<GoodsOption> optionList = optionDAO.getGoodsOptions();
		model.addAttribute("purchase", purchase);
		model.addAttribute("cartlist", cartList);
		model.addAttribute("goodslist", goodsList);
		model.addAttribute("optionlist", optionList);
		
		return model;
	}
	// 주문상태 변경
	public String changeStatement(int purchase_idx, String statement) {
		int result = purchaseDAO.updatePurchaseStatementByMyPage(purchase_idx, statement);
		String returnString;
		if(result == 1) {
			returnString = "변경되었습니다.";
		}else {
			returnString = "실패하였습니다.";
		}
		return returnString;
	}
	
	// 리뷰목록
	public Model reviewList(Model model) {
		ArrayList<Review> reviewList = reviewDAO.getAllReviews();
		ArrayList<ReviewIMGS> reviewImgsList = reviewImgsDAO.getAllReviewImgs();
		HashMap<Integer, String> goodsnameList = new HashMap<>();
		reviewList.forEach(item -> {
			goodsnameList.put(item.getGoods_idx(), goodsDAO.getGoodsName(item.getGoods_idx()));
		});
		model.addAttribute("reviewlist", reviewList);
		model.addAttribute("reviewimgslist", reviewImgsList);
		model.addAttribute("goodsnamelist", goodsnameList);
		return model;
	}
	// 리뷰 답글달기
	public String registReviewReply(HashMap<String, String> param) {
		int review_idx = Integer.parseInt(param.get("review_idx"));
		String review_reply = param.get("review_reply");
		int result = reviewDAO.updateReviewReply(review_idx, review_reply);
		if(result == 1) {
			return "등록되었습니다.";
		}else {
			return "실패하였습니다.";
		}
	}
	
	// 문의관리/ 상품상세정보에 올라온 질문 받기
	public Model getQuestionsFromGoodsDetail(Model model) {
		ArrayList<Question> questionList = questionDAO.getAllQuestions();
		HashMap<Integer, String> userList = new HashMap<>();
		HashMap<Integer, String> goodsList = new HashMap<>();
		questionList.forEach(item -> {
			userList.put(item.getUser_idx(), userDAO.getUserIdByUserIdx(item.getUser_idx()));
			goodsList.put(item.getGoods_idx(), goodsDAO.getGoodsName(item.getGoods_idx()));
		});
		model.addAttribute("questionlist", questionList);
		model.addAttribute("userlist", userList);
		model.addAttribute("goodslist", goodsList);
		model.addAttribute("mode", "Qna");
		return model;
	}
	// 1:1문의로 올라온 질문 받기
	public Model getOneToOneList(Model model) {
		ArrayList<OneToOne> OneToOneList = onetooneDAO.getOneToOneList();
		HashMap<Integer, String> userList = new HashMap<>();
		OneToOneList.forEach(item -> {
			userList.put(item.getUser_idx(), userDAO.getUserIdByUserIdx(item.getUser_idx()));
		});
		model.addAttribute("questionlist", OneToOneList);
		model.addAttribute("userlist", userList);
		model.addAttribute("mode", "OneToOne");
		return model;
	}
	
	// 상품상세 문의글에 답글달기 qna
	public String registQuestionReply(HashMap<String, String> param) {
		int question_idx = Integer.parseInt(param.get("question_idx"));
		String question_reply = param.get("qustion_reply");
		int result = questionDAO.updateQnaAnswer(question_idx, question_reply);
		if(result == 1) {
			return "등록되었습니다.";
		}else {
			return "실패하였습니다.";
		}
	}
	// 1:1문의글에 답글달기
	public String registOneToOneReply(HashMap<String, String> param) {
		int question_idx = Integer.parseInt(param.get("question_idx"));
		String question_reply = param.get("qustion_reply");
		int result = onetooneDAO.updateQnaAnswerByReplyAndContent(question_idx, question_reply);
		if(result == 1) {
			return "등록되었습니다.";
		}else {
			return "실패하였습니다.";
		}
		
	}
	

}
