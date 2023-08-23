package com.monstar.books.vopage;

public class PageVo {
	private Integer displayRowCount = 10; //출력할 데이터 개수
	private Integer grpPageCnt=5;		  // 페이지 그룹에서 페이지 갯수 수정
	private Integer rowStart;			  // 시작 행 번호
	private Integer rowEnd;				  // 종료 행 번호
	private Integer totPage;              // 전체 페이지 수
	private Integer totRow=0;			  // 전체 데이터 수
	private Integer page;				  // 현재 페이지
	private Integer pageStart; 			  // 시작 페이지
	private Integer pageEnd; 			  // 종료 페이지
	
	
	public void pageCalculate(Integer total) {
		getPage();
		totRow = total;    //전체 데이터 수의 정의
		System.out.println("totRow:"+ totRow);
		totPage = (int) (total / displayRowCount);   //전체 페이지 = 전체데이터 / 출력할 데이터
		
		if(total%displayRowCount>0) {   //남은 데이터 마지막 페이지에 표시
			totPage++;
		}
		
		pageStart = (page - (page-1) % grpPageCnt); //스타트 페이지 계산
		pageEnd = pageStart + (grpPageCnt-1); //마지막 페이지 계산
		
		if(pageEnd>totPage) {   //마지막 페이지 조정
			pageEnd=totPage;
		}
		
		rowStart = ((page-1)*displayRowCount)+1; /*시작행 번호 = (현재 페이지 -1 ) * 한페이지에 출력할
												데이터 객수 +1  */
		rowEnd = rowStart + displayRowCount -1; //종료행 번호= 시작행 번호 + 한페이지에 출력할 데이터 갯수
		}
	
	public Integer getPage() {
		if (page == null || page == 0) {// 만약 현재 페이지 값이 없다면 1로 변경해준다.
			page = 1;
		}

		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRowStart() {
		return rowStart;
	}

	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}

	public Integer getRowEnd() {
		return rowEnd;
	}

	public void setRowEnd(Integer rowEnd) {
		this.rowEnd = rowEnd;
	}

	public Integer getDisplayRowCount() {
		return displayRowCount;
	}

	public void setDisplayRowCount(Integer displayRowCount) {
		this.displayRowCount = displayRowCount;
	}

	public Integer getTotPage() {
		return totPage;
	}

	public void setTotPage(Integer totPage) {
		this.totPage = totPage;
	}

	public Integer getTotRow() {
		return totRow;
	}

	public void setTotRow(Integer totRow) {
		this.totRow = totRow;
	}

	public Integer getPageStart() {
		return pageStart;
	}

	public void setPageStart(Integer pageStart) {
		this.pageStart = pageStart;
	}

	public Integer getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(Integer pageEnd) {
		this.pageEnd = pageEnd;
	}
}