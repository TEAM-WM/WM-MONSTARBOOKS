package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyProfileDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MyProfileUpdateService implements MyPageService {

    private SqlSession sqlSession;
    // 생성자
    public MyProfileUpdateService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Model model) {
        
        System.out.println(">>>프로필수정 신호");
        
        // Model을 Map으로 변환하여 데이터 추출
        Map<String, Object> map = model.asMap();
        // Map에서 HttpServletRequest 추출
        HttpServletRequest request =
                (HttpServletRequest) map.get("request");
        
        // 파일 업로드를 위한 경로 설정
        String path="E:\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";
        
        MultipartRequest req=null;
        
        try {
            // MultipartRequest를 사용하여 파일 업로드 처리
            req = new MultipartRequest(request, path, 1024*1024*20, "utf-8", 
                    new DefaultFileRenamePolicy()); // 같은 파일명 존재 시, 1, 2, 3 붙여줌
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        MyProfileDao dao = sqlSession.getMapper(MyProfileDao.class);       
        // 요청 파라미터로부터 데이터 추출
//        int memberno=request.getIntHeader("memberno");
//        int memberno=request.getIntHeader("memberno");
        try {
            int memberno = Integer.parseInt(request.getParameter("memberno"));
            String mprofileimg = ((MultipartRequest) request).getFilesystemName("mprofileimg");
//         String mprofileimg = request.getParameter("mprofileimg").trim();
//         String mid = request.getParameter("mid");
//         String mname = request.getParameter("mname");
  
          if (mprofileimg == null) {
              mprofileimg = "";
          }
                 
            // MyProfileDao를 이용하여 데이터베이스 업데이트 수행
            dao.update(memberno,mprofileimg);
		} catch (NumberFormatException e) {
			// TODO: handle exception
		} catch (Exception e) {
			// TODO: handle exception
		}

    } // execute method

}// class 종료
