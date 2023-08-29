package com.monstar.books.member.sevice;

import java.util.Map;

import org.springframework.ui.Model;

public interface MemberServiceMap {
	public Map<String, Object> execute(Model model);
}// interface 종료