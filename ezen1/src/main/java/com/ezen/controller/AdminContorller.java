package com.ezen.controller;

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

import com.ezen.dto.Goods;
import com.ezen.service.AdminService;
import com.ezen.service.FileService;

@Controller
@RequestMapping("admin")
public class AdminContorller {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	FileService fileService;
	
	
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
	
	@RequestMapping("memberListpopup")
	public String memberListpopup() {
		return "admin/memberListpopup";
	}
	
	@RequestMapping("stock")
	public String stock() {
		return "admin/stock";
	}
	
	@RequestMapping("goods")
	public String goods() {
		return "admin/goods";
	}
	// 섬네일 등록
	@PostMapping("uploadGoodsThumbAction")
	@ResponseBody
	public String uploadeThumb(@RequestParam("file") MultipartFile multipartFile) {
		String result = fileService.fileUploader("thumb", multipartFile);
		if(result.charAt(0) == 'f') {
			System.out.println(result);
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	// 상세이미지 등록
	@PostMapping("uploadGoodsDetailAction")
	@ResponseBody
	public String uploadDetail(@RequestParam("file") MultipartFile multipartFile) {
		String result = fileService.fileUploader("detail", multipartFile);
		if(result.charAt(0) == 'f') {
			System.out.println(result);
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	
	// 상품등록
	@PostMapping("productRegisterAction")
	@ResponseBody
	public String uploadGoods(@RequestBody Goods goods) {
		System.out.println(goods.toString());
		String result = adminService.insertGoods(goods);
		return result;
	}
	
	// 상품이미지등록
	@PostMapping("uploadGoodsIMGSAction")
	@ResponseBody
	public String uploadGoodsImgs(@RequestParam("img1")MultipartFile fileOne,
								@RequestParam("img2")MultipartFile fileTow,
								@RequestParam("img3")MultipartFile fileThree) {
		return "업로드";
	}
	
	@RequestMapping("review")
	public String review() {
		return "admin/review";
	}
	
	@RequestMapping("transaction")
	public String transaction() {
		return "admin/transaction";
	}
	
	@RequestMapping("transactionpop")
	public String transactionpop() {
		return "admin/transactionpop";
	}
	
	@RequestMapping("eventConfig")
	public String eventConfig() {
		return "admin/eventConfig";
	}
	
}
