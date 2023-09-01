package com.monstar.books.adbanner.dao;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.monstar.books.adbanner.dto.BannerDto;

public interface BannerDao {

	public ArrayList<BannerDto> list(int Start, int End, String sk, String selNum);

	public void bannerwrite(String etitle, String efilesrc);

	public BannerDto bannerdetail(int bannerno);

	public void bannerdelete(int bannerno);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount4(String searchKeyword);


}//interface 종료