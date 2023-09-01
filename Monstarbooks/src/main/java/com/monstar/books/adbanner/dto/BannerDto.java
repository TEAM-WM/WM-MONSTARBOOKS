package com.monstar.books.adbanner.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class BannerDto {
	private int bannerno; //배너번호
	private int eventno; //이벤트번호
	private String etitle; //배너제목
	private String efilesrc; //첨부파일
	private Date eregdate; //작성날짜
	
	private EventDto Event;
}
