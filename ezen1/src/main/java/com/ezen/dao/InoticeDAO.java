package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Notice;

@Mapper
public interface InoticeDAO {
	//Notice를 받아 MALL_NOTICE에 insert
	public int insertNotice(Notice notice);
	//해당 notice_idx 를 갖는 row를 받은 파라미터값으로 update
	public int updateNotice(String notice_idx);
	//MALL_NOTICE의  공지목록 가져옴
	public ArrayList<Notice> getNoticeLIst();
	//MALL_NOTICE의 해당 notice_idx를 갖는 공지 가져옴
	public Notice getNotice(String notice_idx);
}
