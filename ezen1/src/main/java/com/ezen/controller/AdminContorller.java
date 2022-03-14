package com.ezen.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.IpurchaseDAO;
import com.ezen.dto.Goods;
import com.ezen.dto.GoodsIMGS;
import com.ezen.dto.Purchase;
import com.ezen.service.AdminService;
import com.ezen.service.FileService;

@Controller
@RequestMapping("admin")
public class AdminContorller {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	IgoodsIMGSDAO goodsImgsDAO;
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	IpurchaseDAO purchaseDAO;
	
	
	@RequestMapping("")
	public String adminRoot() {
		return "redirect:admin/main";
	}

	@RequestMapping("main")
	public String adminMain() {
		return "admin/main";
	}
	
	@RequestMapping("memberList")
	public String memberList(Model model) {
		return "admin/memberList";
	}
	// memberList 상단 필터
	@GetMapping("userSearchAction")
	public String memberListFilter(@RequestParam(name = "cat")int cat,
									@RequestParam(name = "searchText",required = false)String searchText,
									Model model) {
		if(cat == 0) {
			model = adminService.MemberListBySearch(searchText, model);
		}
		return "";
	}
	
	/////////////////////////////////////////
	// 문의관리 페이지
	/////////////////////////////////////////
	@RequestMapping("qnaList")
	public String qnaList(@RequestParam(required = false) String cat,Model model) {
		try {
			if(cat.equals("Qna")) {
				model = adminService.getQuestionsFromGoodsDetail(model);
				return "admin/qnaList";
			}else {
				model = adminService.getOneToOneList(model);
				return "admin/qnaList";
			}
		} catch (NullPointerException e) {
			model = adminService.getQuestionsFromGoodsDetail(model);
		}
		
		return "admin/qnaList";
	}
	// 상품상세문의 답글등록 qna
	@PostMapping("registerQuestionReplyAction")
	@ResponseBody
	public String registerQuestionReply(@RequestBody HashMap<String, String> param) {
		return adminService.registQuestionReply(param);
	}
	// 상품상세문의 답글등록 1:1문의
	@PostMapping("registerOneToOneReplyAction")
	@ResponseBody
	public String registerOneToOneReply(@RequestBody HashMap<String, String> param) {
		return adminService.registOneToOneReply(param);
	}
	
	
	
	@RequestMapping("memberListpopup")
	public String memberListpopup() {
		return "admin/memberListpopup";
	}
	
	///////////////////////////////
	// 재고관리 페이지
	///////////////////////////////
	@RequestMapping("stock")
	public String stock(@RequestParam(required = false, defaultValue = "1") String currentPage, Model model) {
		if(model.containsAttribute("goodslist") == false) {
		model = adminService.getGoodsList(currentPage, model);
		}
		model.addAttribute("entireItemCardMode", 2);
		return "admin/stock";
	}
	// stock search & onEvent search
	@GetMapping("adminStockSearchAction")
	public String stockSearch(@RequestParam(required = false) String searchText,
							@RequestParam String search_cat,
							@RequestParam String page,
							Model model) {
		model = adminService.stockSearch(searchText, search_cat, model);
		if(page.equals("stock")) {
		return stock("1", model);
		}else {
			return eventConfig("1", model);
		}
	}
	// stock 품절처리
	@PostMapping("inventorySoldOutAction")
	@ResponseBody
	public void soldOutGoods(@RequestBody HashMap<String, Boolean> param) {
		adminService.makeGoodsSoldOut(param);
	}
	// stock 상품 삭제
	@PostMapping("inventoryDeleteAction")
	@ResponseBody
	public String deleteGoods(@RequestParam HashMap<String, String> param) {
		adminService.deleteGoodsOnDB(param);
		return "<script>alert('삭제되었습니다.');location.href='stock';</script>";
	}
	// stock 발주
	@PostMapping("inventoryOrderAction")
	@ResponseBody
	public void orderGoods(@RequestBody HashMap<String, String> param) {
		System.out.println(param.toString());
		adminService.orderGoods(param);
	}
	
	/////////////////////////////
	// 상품등록 페이지
	/////////////////////////////
	@RequestMapping("goods")
	public String goods() {
		return "admin/goods";
	}
	// 섬네일 등록
	@PostMapping("uploadGoodsThumbAction")
	@ResponseBody
	public String uploadeThumb(@RequestParam("file") MultipartFile multipartFile) throws IOException {
		String result = fileService.fileUploader("thumb", multipartFile);
		if(result.charAt(0) == 'f') {
			result = "false";
		}
		return result;
	}
	// 상세이미지 등록
	@PostMapping("uploadGoodsDetailAction")
	@ResponseBody
	public String uploadDetail(@RequestParam("file") MultipartFile multipartFile) throws IOException {
		String result = fileService.fileUploader("detail", multipartFile);
		if(result.charAt(0) == 'f') {
			result = "false";
		}
		return result;
	}
	// 상품등록
	@PostMapping("productRegisterAction")
	@ResponseBody
	public String uploadGoods(@RequestBody Goods goods) {
		String result = adminService.insertGoods(goods);
		return result;
	}
	// 상품이미지등록
	@PostMapping("uploadGoodsIMGSAction")
	@ResponseBody
	public String uploadGoodsImgs(@RequestParam("img1")MultipartFile fileOne,
								@RequestParam("img2")MultipartFile fileTow,
								@RequestParam("img3")MultipartFile fileThree,
								@RequestParam("goods_idx")String idx) throws IOException {
		int goods_idx = Integer.parseInt(idx);
		String goods_img1 = fileService.fileUploader("goods", fileOne);
		String goods_img2 = fileService.fileUploader("goods", fileTow);
		String goods_img3 = fileService.fileUploader("goods", fileThree);
		GoodsIMGS img1 = GoodsIMGS.builder().goods_idx(goods_idx).goods_img(goods_img1).build();
		GoodsIMGS img2 = GoodsIMGS.builder().goods_idx(goods_idx).goods_img(goods_img2).build();
		GoodsIMGS img3 = GoodsIMGS.builder().goods_idx(goods_idx).goods_img(goods_img3).build();
		int result1 = goodsImgsDAO.insertGoodsImgs(img1);
		int result2 = goodsImgsDAO.insertGoodsImgs(img2);
		int result3 = goodsImgsDAO.insertGoodsImgs(img3);
		return "<script>alert('등록되었습니다.'); location.href='goods';</script>";
	}
	
	///////////////////////////////
	//  리뷰관리 페이지
	///////////////////////////////
	@RequestMapping("review")
	public String review(Model model) {
		model = adminService.reviewList(model);
		return "admin/review";
	}
	// 리뷰 답글 등록
	@PostMapping("registReviewReplyAction")
	@ResponseBody
	public String registReviewReply(@RequestBody HashMap<String, String> param) {
		return adminService.registReviewReply(param);
	}
	
	
	//////////////////////////////
	// 주문목록 페이지
	//////////////////////////////
	@GetMapping("transaction")
	public String transaction(@RequestParam(required = false) String statement, Model model) {
		try {
			model = adminService.transactionFiltered(statement, model);
		} catch (NullPointerException e) {
			model = adminService.transaction(model);
		}
		System.out.println(model.toString());
		return "admin/transaction";
	}
	////////////////////////////
	// 주문목록 상세페이지
	////////////////////////////
	@GetMapping("transactionpop")
	public String transactionpop(@RequestParam String purchase_idx, Model model) {
		int purchaseIdx = Integer.parseInt(purchase_idx);
		model = adminService.transactionDetail(purchaseIdx, model);
		return "admin/transactionpop";
	}
	// 주문상태 변경
	@PostMapping("changeStatementAction")
	@ResponseBody
	public String changeStatement(@RequestBody HashMap<String, String> param) {
		int purchase_idx = Integer.parseInt(param.get("purchase_idx"));
		String purchase_statement = param.get("purchase_statement");
		String returnString = adminService.changeStatement(purchase_idx, purchase_statement);
		return returnString;
	}
	
	////////////////////////////////
	// 이벤트관리페이지
	////////////////////////////////
	@RequestMapping("eventConfig")
	public String eventConfig(@RequestParam(required = false, defaultValue = "1") String currentPage, Model model) {
		if(model.containsAttribute("goodslist") == false) {
		model = adminService.getGoodsList(currentPage, model);
		}
		model.addAttribute("entireItemCardMode", 2);
		return "admin/eventConfig";
	}
	// 할인상품등록
	@PostMapping("discountProductAction")
	@ResponseBody
	public String registerEventDiscount(@RequestParam HashMap<String, String> list) {
		adminService.registerEventDiscount(list);
		return "<script>alert('변경되었습니다.'); location.href='eventConfig';</script>";
	}
	// 이벤트진행중 상품등록
	@PostMapping("eventProductAction")
	@ResponseBody
	public String registerEventEvent(@RequestParam HashMap<String, String> list) {
		adminService.registerEventEvent(list);
		return "<script>alert('변경되었습니다.'); location.href='eventConfig';</script>";
	}
	// 추천상품등록
	@PostMapping("recommendProductAction")
	@ResponseBody
	public String registerEventRecommend(@RequestParam HashMap<String, String> list) {
		adminService.registerEventRecommend(list);
		return "<script>alert('변경되었습니다.'); location.href='eventConfig';</script>";
	}
	
}
