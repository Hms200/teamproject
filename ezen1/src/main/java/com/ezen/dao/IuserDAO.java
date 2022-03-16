package com.ezen.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.User;

@Mapper
public interface IuserDAO {
	//로그인 둘 다 가져와서 사용.-> 아이디없으면 없는 사용자 표시 ->있으면 패스워드 정보로 넘어감.
	//MALL_USER에서 사용자 아이디를 조회해서 가져옴.
	public String getUserID(String user_id);
	//MALL_USER에서 사용자 비밀번호를 조회해서 가져옴.
	public String getUserPw(String user_id);
	//아이디찾기. MALL_USER에서 사용자 아이디를 이름과 이메일을 받아서 가져옴.
	public String getUserIdByFindId(String user_name, String user_email);
	//비밀번호찾기. MALL_USER에서 사용자 비밀번호를 이름 아이디, 이메일을 받아서 가져옴.
	public String getUserPwByFindPw (String user_id, String user_name, String user_email);
	//MALL_USER에서 사용자 아이디를 받아 해당하는 아이디의 인덱스를 가져옴.
	public int getUserIdx(String user_id);
	//회원가입. 유저를 받아 MALL_USER에 인서트.
	public int insertUser(User user);
	//회원탈퇴. 유저 아이디를 받아 MALL_USER에서 일치하는 정보 딜리트.
	public int deleteUser(String user_id);
	//회원정보조회. 유저 아이디를 받아 MALL_USER에서 일치하는 회원의 모든 데이터를 가져옴.
	public User getMemberInfo(String user_id);
	//회원정보수정. 유저를 받아 MALL_USER의 일치하는 아이디에 업데이트.
	public int UpdateMemberInfo(User user);
	//user_idx를 받아 해당 user 정보 가져옴
	public User getMemberInfoByUserIdx(int user_idx);
	
	// 회원 검색용
	// Id
	public ArrayList<User> searchUserById(String searchText);
	// user_idx로 user_id 가져옴
	public String getUserIdByUserIdx(int user_idx);
	
	public ArrayList<HashMap<String, String>> getAllUserInfoForAdmin();
	
}
