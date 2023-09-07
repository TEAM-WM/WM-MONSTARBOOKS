package com.monstar.books.mypage.service;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dto.MyReviewDto;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
@Primary
@Slf4j
public class MyReviewUpdateService implements MyPageService {

    @Autowired
    private SqlSession sqlSession;

    public MyReviewUpdateService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Model model) {
        log.info(">>> MyReviewUpdateService");

        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
//        MemberDto member = (MemberDto) request.getSession().getAttribute("user");

        // 파일 업로드를 위한 경로 설정
        String path = "E:\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";

        MultipartRequest req = null;

        try {
            // MultipartRequest를 사용하여 파일 업로드 처리
            req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
            // 같은 파일명 존재 시, 1, 2, 3 붙여줌
            
            MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);

            // 요청 파라미터로부터 데이터 추출
            int rStar = Integer.parseInt(request.getParameter("rstar"));
//            String rTitle = request.getParameter("rtitle");
            String rContent = request.getParameter("rcontent");
            int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
            String refilesrc = req.getFilesystemName("refilesrc"); // TODO : 파일 업로드

            MyReviewDto viewDto = dao.myReviewView(reviewNo);

            // 잘못된 reviewNo
            if (viewDto == null) {
                log.error("잘못된 reviewNo");
                // TODO : 예외 처리
            }

            // 본인의 리뷰만 수정할 수 있어야 한다.
//            if (viewDto.getMemberno() != member.getMemberno()) {
//                log.error("잘못된 접근");
//                // TODO : 예외 처리
//            }

//          dao.reviewUpdate(rStar, rTitle, rContent, reviewNo, refilesrc);
            dao.reviewUpdate(rStar, rContent, reviewNo, refilesrc);
            
        } catch (Exception e) {
            e.printStackTrace();
            return; // 예외 처리를 제대로 수행하고, 처리를 중단합니다.
        }


    }
}