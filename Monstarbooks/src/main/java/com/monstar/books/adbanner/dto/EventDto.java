package com.monstar.books.adbanner.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EventDto {
	private int eventno;
	private String etitle;
	private String econtent;
	private String efilesrc;
	private Date eregdate;
	private String deleted;
	private String e_etitle;
	

}
