package com.monstar.books.adbanner.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dao.BannerDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BannerServiceWrite implements BannerService {

	@Autowired
	private SqlSession session;

	// 생성자
	public BannerServiceWrite(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>배너 등록 신호");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		BannerDao dao = session.getMapper(BannerDao.class);
		
		String path = "/Users/chajong-geon/git/WM-MONSTARBOOKS/Monstarbooks/src/main/webapp/resources/assets/imgs/banner";

		MultipartRequest req = null;
		try {
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String etitle = req.getParameter("etitle");
		String efilesrc = req.getFilesystemName("efilesrc");
		String e_etitle = req.getParameter("e_etitle");
		
		
		if (efilesrc == null) {
			efilesrc = "";
		}
		dao.bannerwrite(etitle, efilesrc,e_etitle);

	}

}
