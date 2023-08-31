package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Primary
public class MyReviewUpdateService implements MyPageService {

    @Autowired
    private SqlSession sqlSession;

    public MyReviewUpdateService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Model model) {
        System.out.println(">>> MyReviewUpdateService");

        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");

        // 파일 업로드를 위한 경로 설정
        String path = "E:\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";

        MultipartRequest req = null;

        try {
            // MultipartRequest를 사용하여 파일 업로드 처리
            req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
            // 같은 파일명 존재 시, 1, 2, 3 붙여줌
        } catch (Exception e) {
            e.printStackTrace();
            return; // 예외 처리를 제대로 수행하고, 처리를 중단합니다.
        }

        MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);

        // 요청 파라미터로부터 데이터 추출
        String reviewno = req.getParameter("reviewno");
        String memberno = req.getParameter("memberno");
        String rtitle = req.getParameter("rtitle");
        String rcontent = req.getParameter("rcontent");
        String rstar = req.getParameter("rstar");
        String refilesrc = req.getFilesystemName("refilesrc");
        String book = req.getParameter("book");
        String bookcategory = req.getParameter("bookcategory");

        System.out.println("refilesrc : " + refilesrc);

        if (refilesrc == null) {
            refilesrc = "";
        }

//        try {
            // MyReviewDao를 이용하여 데이터베이스 업데이트 수행
            dao.reviewupdate(reviewno, memberno, rtitle, rcontent, rstar, refilesrc, book, bookcategory);
//        } catch (Exception e) {
//            e.printStackTrace(); // 예외 정보를 로그로 출력
//        }

    }
}