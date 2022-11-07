package com.project.greenbook.service;

import com.project.greenbook.dao.ReviewDAO;
import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private SqlSession sqlSession;
    @Override
    public ArrayList<ReviewDTO> review(String bookId) {
        System.out.println("@@@### BServiceImpl.review_list() start");

        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        ArrayList<ReviewDTO> review = dao.review(bookId);

        System.out.println("@@@### BServiceImpl.revuew_list() end");
        return review;
    }

    @Override
    public void review_write(HashMap<String, String> param) {
        System.out.println("@@@### BServiceImpl.review_write() start");

        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        dao.review_write(param);

        System.out.println("@@@### BServiceImpl.review_write() end");
    }

    @Override
    public void delete(HashMap<String, String> param) {
        System.out.println("@@@### BServiceImpl.delete() start");
        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        dao.delete(param);

        System.out.println("@@@### BServiceImpl.delete() end");
    }

    @Override
    public int review_count(String bookId) {
        System.out.println("@@@### review.count() start");
        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        int review_count = dao.review_count(bookId);
        System.out.println("@@@### review.count() cout = "+review_count);

        return review_count;
    }

    @Override
    public int review_sum(String bookId) {
        System.out.println("@@@### review.sum() start");
        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        int review_sum = dao.review_sum(bookId);
        System.out.println("@@@### review.count() sum = "+review_sum);

        return review_sum;
    }

    @Override
    public BookDTO bookDetail(String bookId) {
        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        BookDTO bookDetail = dao.bookDetail(bookId);
        return bookDetail;
    }

    @Override
    public BookImgDTO bookImg(String bookId) {
        ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
        BookImgDTO bookImg = dao.bookImg(bookId);
        return bookImg;
    }
}
