package com.ezen.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.Notice;

@Mapper
public interface InoticeDAO {
	public int insertNotice();
	public int updateNotice();
	public ArrayList<Notice> getNoticeLIst();
	public Notice getNotice();
}
