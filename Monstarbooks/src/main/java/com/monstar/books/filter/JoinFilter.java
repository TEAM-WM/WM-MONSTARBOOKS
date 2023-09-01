package com.monstar.books.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml에 필터 정의와 필터 맵핑을 어노테이션을 이용해서 할 수 있다.
//필터링할 요청 경로를 배열로 여러개 지정 할 수 있다.
@WebFilter({ "/join", "/join/access" })
public class JoinFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 클라이언트가 로그인 했는지 여부를 확인한다.
		// 부모 type을 자식type으로 casting 후
		HttpServletRequest req = (HttpServletRequest) request;
		// 객체의 참조값을 얻어낸다.
//		HttpSession session = req.getSession();
		// 이용약관이 체크됐는지
		// 주소가 "/join" 또는 "/join/access"인 경우 약관 동의 여부를 확인하여 처리
		if (req.getServletPath().equals("/join") || req.getServletPath().equals("/join/access")) {
			// 파라미터들을 가져옴
			String termsAll = req.getParameter("termsAll");
			String policyAgree = req.getParameter("policyAgree");
			String privacyAgree = req.getParameter("privacyAgree");
			String limitAgree = req.getParameter("limitAgree");

			boolean parametersValid = 
		            "전체선택".equals(termsAll) &&
		            "이용약관".equals(policyAgree) &&
		            "개인정보".equals(privacyAgree) &&
		            "만14세".equals(limitAgree);

		        // 파라미터가 유효하지 않거나 누락되었을 경우 리다이렉트
		        if (!parametersValid) {
		            redirectToTermsPage(req, response);
		            return; // 리다이렉트 후 메서드 종료
		        }
		}//if

		chain.doFilter(request, response);

		System.out.println(req.getParameter("termsAll"));
		System.out.println(req.getParameter("policyAgree"));
		System.out.println(req.getParameter("privacyAgree"));
		System.out.println(req.getParameter("limitAgree"));

	}// doFilter

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}// init

	
	private void redirectToTermsPage(HttpServletRequest req, ServletResponse response) throws IOException {
	    HttpServletResponse res = (HttpServletResponse) response;
	    String cPath = req.getContextPath();
	    res.sendRedirect(cPath + "/join/terms");
	}
}// JoinFilter