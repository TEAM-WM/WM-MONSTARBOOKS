package com.monstar.books.adevent.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adevent.dao.AdEventDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class AdEventServiceModify implements AdEventService {

	@Autowired
	private SqlSession session;

	// 생성자
	public AdEventServiceModify(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>이벤트 수정 신호");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		AdEventDao dao = session.getMapper(AdEventDao.class);
		
		String path = "/Users/chajong-geon/git/WM-MONSTARBOOKS/Monstarbooks/src/main/webapp/resources/assets/imgs/coupon";
						
		MultipartRequest req = null;
		try {
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String etitle = req.getParameter("etitle");
		System.out.println(etitle);
		String efilesrc = req.getFilesystemName("efilesrc");
		System.out.println(efilesrc);	
		int eventno = Integer.parseInt(req.getParameter("eventno"));
		System.out.println(eventno+"번호");
		
		if (efilesrc == null) {
			efilesrc = "";
		}
		dao.eventmodify(eventno,etitle);
		dao.eventmodify2(eventno,efilesrc);

	}

}
