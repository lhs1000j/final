package com.project.greenbook.service;

import com.project.greenbook.dao.BuyDAO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BuyDTO;
import com.project.greenbook.dto.OrderDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class BuyServiceImpl implements BuyService{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<BuyDTO> cart(String member_id) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class); // getMapper() 메서드를 사용해서, 호출한 뒤에, 값을 dao에 대입
        ArrayList<BuyDTO> cart = dao.cart(member_id);
        return cart;
    }

    @Override
    public int cartCount(String member_id) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        int count = dao.cartCount(member_id);
        return count;
    }

    @Override
    public void cartAdd(HashMap<String, String> param) {

        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.cartAdd(param);
    }

    @Override
    public void cartCountUpdate(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.cartCountUpdate(param);
    }

    @Override
    public void cancel(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.cancel(param);
    }

    @Override
    public void orderAdd(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.orderAdd(param);
    }
    @Override
    public void speedOrderAdd(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.speedOrderAdd(param);
    }

    @Override
    public void orderDelete(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.orderDelete(param);
    }

    @Override
    public ArrayList<OrderDTO> orderList(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        ArrayList<OrderDTO> orderList = dao.orderList(param);

        return orderList;
    }
    @Override
    public ArrayList<OrderDTO> orderOkList(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        ArrayList<OrderDTO> orderOkList = dao.orderOkList(param);
        return orderOkList;
    }

    @Override
    public void updateCount(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.updateCount(param);
    }

    @Override
    public BookImgDTO contentImg(int bookId) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        BookImgDTO bookImg = dao.contentImg(bookId);
        return bookImg;
    }
}
