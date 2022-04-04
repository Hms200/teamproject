package com.ezen.service;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
@ToString
public class Pagenation {

	private String currentPage;
	private int startNumOfRow;
	private int endNumOfRow;
	private int countOfPages;
	private int beginPagenation;
	private int endPagenation;
	
	
	// bootstrap Pagenation component적용을 위한 매서드
	// currentPage  :  현재 브라우저상에 보여지는 페이지(pagenation bar로 페이지 이동할 때 파라미터로받아와야함)
	// countOfArticles : 대상 DB 테이블의 전체 row 갯수
	// numberOfArticlesOnPage : 한 페이지에서 보여줄 row 갯수
	// numberOfPagenation : pagenation bar에 표시할 페이지 갯수
	public Pagenation pagenation(String currentPage, int countOfArticles, int numberOfArticlesOnPage, int numberOfPagenation) {
		if(currentPage.equals(null) || currentPage.equals("")) {
			currentPage = "1";
		}
		// 전체 페이지 수 구함
		int countOfPages =  countOfArticles%numberOfArticlesOnPage == 0 ? 
				countOfArticles/numberOfArticlesOnPage : countOfArticles/numberOfArticlesOnPage+1 ;
		// 끝 row 값
		int endNumOfRow = countOfArticles-(Integer.parseInt(currentPage)-1)*numberOfArticlesOnPage;
		// 시작 row 값
		int startNumOfRow = (endNumOfRow - numberOfArticlesOnPage +1) <= 0 ? 1 : endNumOfRow - numberOfArticlesOnPage +1;
		// pagenation 시작 값
		int beginPagenation = Integer.parseInt(currentPage)%numberOfPagenation == 0 ?
				(Integer.parseInt(currentPage))-numberOfPagenation +1 : ((Integer.parseInt(currentPage))/numberOfPagenation)*numberOfPagenation+1;
		// pagenation 끝 값 
		int endPagenation;
		if(Integer.parseInt(currentPage)%numberOfPagenation == 0) {
			endPagenation = Integer.parseInt(currentPage);
		}else if(Integer.parseInt(currentPage)/numberOfPagenation == countOfPages/numberOfPagenation) {
			endPagenation = countOfPages;
		}else {
			endPagenation = ((Integer.parseInt(currentPage)/numberOfPagenation)+1)*numberOfPagenation;
		}
		
		Pagenation pagenation = Pagenation.builder()
								.currentPage(currentPage)
								.startNumOfRow(startNumOfRow)
								.endNumOfRow(endNumOfRow)
								.countOfPages(countOfPages)
								.beginPagenation(beginPagenation)
								.endPagenation(endPagenation)
								.build();

		return pagenation;
	}
}
