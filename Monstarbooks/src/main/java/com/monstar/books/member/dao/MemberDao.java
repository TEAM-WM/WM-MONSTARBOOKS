package com.monstar.books.member.dao;

import java.util.ArrayList;

import com.monstar.books.member.dto.MemberDto;

public interface MemberDao {
	public void insert(MemberDto dto);
	public ArrayList<MemberDto> list();
	public String isExist(String inputId);
	public MemberDto getData(String mid);
}//======== MemberDao ========