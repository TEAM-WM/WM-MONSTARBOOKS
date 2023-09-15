package com.monstar.books.adbanner.dao;

import java.util.ArrayList;

import com.monstar.books.adbanner.dto.BannerDto;
import com.monstar.books.adbanner.dto.EventDto;

public interface BannerDao {

	public ArrayList<BannerDto> list(int Start, int End, String sk, String selNum);

	public void bannerwrite(String etitle, String efilesrc, String e_etitle);

	public BannerDto bannerdetail(int bannerno);

	public void bannerdelete(int bannerno);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount4(String searchKeyword);

	public void bannermodify(int bannerno, String etitle);

	public void bannermodify2(int bannerno, String efilesrc);

}//interface 종료