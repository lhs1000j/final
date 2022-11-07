package com.project.greenbook.service;

import com.project.greenbook.dao.QnaDao;
import com.project.greenbook.dto.QnaDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service("QnaService")
public class QnaServiceImpl implements  QnaService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<QnaDto> list() {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        ArrayList<QnaDto> list = dao.list();
        return list;
    }
    @Override
    public void write(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        dao.write(param);
    }
    @Override
    public QnaDto contentView(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        QnaDto dto = dao.contentView(param);
        return dto;
    }
    @Override
    public QnaDto modifyView(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        QnaDto dto = dao.modifyView(param);
        return dto;
    }
    @Override
    public QnaDto replyView(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        QnaDto dto = dao.replyView(param);
        return dto;
    }
    @Override
    public void modify(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        dao.modify(param);
    }
    @Override
    public void delete(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        dao.delete(param);
    }
    @Override
    public void upHit(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        dao.upHit(param);
    }
    @Override
    public int countQna(HashMap<String, String> param) {
        System.out.println("QnaServiceImpl.countBookInfo() start");
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        int count = dao.countQna(param);
        System.out.println("QnaServiceImpl.countBookInfo() end");
        return count;
    }
    @Override
    public ArrayList<QnaDto> qnaList(HashMap<String, String> param) {
        QnaDao dao = sqlSession.getMapper(QnaDao.class);
        ArrayList<QnaDto> list = dao.qnaList(param);
        return list;
    }
}
