package com.monstar.books.cs.dao;

import java.util.ArrayList;

import com.monstar.books.adfaq.dto.AdFaqDto;

public interface CsDao {
	public ArrayList<AdFaqDto> csFaqList(String code);
	public ArrayList<AdFaqDto> csFaqAllList(String word);
}//csDa