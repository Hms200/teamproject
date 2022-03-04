package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Notice;

@Mapper
public interface InoticeDAO {
	//Notice를 받아 MALL_NOTICE에 insert
	public int insertNotice(Notice notice);
	//해당 notice_idx 를 갖는 row를 받은 파라미터값으로 update
	public int updateNotice(Notice notice);
	//MALL_NOTICE의  공지목록 가져옴
	public ArrayList<Notice> getNoticeLIst(int start, int end);
	//MALL_NOTICE의 해당 notice_idx를 갖는 공지 가져옴
	public Notice getNotice(int notice_idx);
	//메인화면용 공지사항 리스트
	public ArrayList<Notice> getNoticeForMain();
	// 전체 공지사항 갯수
	public int countOfNotice();
	// notice 삭제
	public int deleteNotice(int notice_idx);
}
