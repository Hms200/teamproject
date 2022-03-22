package com.ezen.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.ezen.dto.User;


@Mapper
public interface IuserDAO {
	//로그인
	public String getUserID(String user_id);
	//MALL_USER에서 사용자 비밀번호를 조회
	public String getUserPw(int user_idx);
	//아이디찾기
	public String getUserIdByFindId(String user_name, String user_email);
	//비밀번호찾기
	public String getUserPwByFindPw (String user_id, String user_name, String user_email);
	//MALL_USER에서 사용자 아이디를 받아 해당하는 아이디의 인덱스를 가져옴.
	public int getUserIdx(String user_id);
	//회원가입
	public int insertUser(User user);
	//소셜로그인회원 정보저장
	public int insertUserLoginedByOAuth(User user);
	//회원탈퇴
	public int deleteUser(String user_id);
	//회원정보조회
	public User getMemberInfo(String user_id);
	//회원정보수정
	public int UpdateMemberInfo(User user);
	//user_idx를 받아 해당 user 정보 가져옴
	public User getMemberInfoByUserIdx(int user_idx);
	//임시 비밀번호 발급
	public int updateUserPwByDisposablePassword(String user_id, String disposablePW);
	
	// 회원 검색용
	// Id
	public ArrayList<User> searchUserById(String searchText);
	// user_idx로 user_id 가져옴
	public String getUserIdByUserIdx(int user_idx);
	
	public ArrayList<HashMap<String, String>> getAllUserInfoForAdmin();
	
}
