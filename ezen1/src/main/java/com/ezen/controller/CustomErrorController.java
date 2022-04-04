package com.ezen.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
public class CustomErrorController implements ErrorController {

	@RequestMapping("/error")
	public String handleError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		String errorMessage = "";
		if (status != null) {
			int statusCode = Integer.parseInt(status.toString());

			// 404 에러
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				log.info("404 ERROR!");
				errorMessage = ""+statusCode;
				request.setAttribute("errorMessage", errorMessage);
				//request.getRequestDispatcher("/error/error").forward(request, response);
				return "error/404";
			}
			// 500 에러
			 if (statusCode == HttpStatus.FORBIDDEN.value()) {
				 log.info("500 ERROR!");
				 errorMessage = ""+statusCode;
				 request.setAttribute("errorMessage", errorMessage);
				// request.getRequestDispatcher("/error/error").forward(request, response);
				 return "error/500";
			 }

		}
		request.setAttribute("errorMessage", errorMessage);
		request.getRequestDispatcher("/error/error").forward(request, response);
		return "error/500";
	}


	
}