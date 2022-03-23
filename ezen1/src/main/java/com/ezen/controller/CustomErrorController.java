package com.ezen.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class CustomErrorController implements ErrorController {

	@GetMapping("/error")
	public String handleError(HttpServletRequest request, Model model) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());

			// 404 에러
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				log.info("404 ERROR!");
				model.addAttribute("errorMessage", statusCode);
			}
			// 500 에러(프로젝트 완료시 주석 해제)
			 if (statusCode == HttpStatus.FORBIDDEN.value()) {
			 log.info("500 ERROR!");
			 model.addAttribute("errorMessage", statusCode);
			 }

		}
		return "error/error";
	}


	
}