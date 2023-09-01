package com.monstar.books.adqna.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adqna.dao.QnaDao;
import com.monstar.books.adqna.dto.QnaDto;

@Service
public class QnaDetailReplyService implements QnaService {

	@Autowired
	private SqlSession session;

	// 생성자
	public QnaDetailReplyService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println("1:1디테일 답변");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		System.out.println("서비스답글 >>>>>"+request.getParameter("qanswer"));
		String qanswer = request.getParameter("qanswer");
		System.out.println("서비스답 qanswer : >>>"+qanswer);
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		System.out.println("서비스 번호"+qnano);
		QnaDao dao = session.getMapper(QnaDao.class);
		
		
//		기존 답변 가져오기
		QnaDto existingQna=dao.qnadetail(qnano);

//		답변 내용 수정
//		existingQna.setQanswer(qanswer);
		dao.qnaAnswer(qnano, qanswer);
//		QnaDto dto = dao.qnadetailreply(qnano, qanswer);
		model.addAttribute("reply", existingQna);
//		model.addAttribute("qnadetailreply", existingQna);
	}

}
