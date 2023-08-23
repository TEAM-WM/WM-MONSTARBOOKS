package com.monstar.books.vopage;

public class SearchVo extends PageVo{
					
	private String searchKeyword = "";   //검색 키워드
	private String searchType = "";  	//검색 필듸: 제목, 내용
	private String [] searchTypeAtt; 	// 검색 필드를 배열로 변환.
	
	public String getSearchKeyword() {
		
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String[] getSearchTypeAtt() {
		return searchTypeAtt;
	}
	public void setSearchTypeAtt(String[] searchTypeAtt) {
		this.searchTypeAtt = searchTypeAtt;
	}
	

}
