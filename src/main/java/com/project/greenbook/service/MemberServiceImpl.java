package com.project.greenbook.service;

import com.project.greenbook.dao.MemberDAO;
import com.project.greenbook.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private SqlSession sqlSession;


    @Override
    public ArrayList<MemberDTO> loginCheck(HashMap<String, String> param) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        ArrayList<MemberDTO> dtos = dao.loginCheck(param);

        return dtos;
    }

    @Override
    public void logout(HttpSession session) {
        session.invalidate(); // 세션 초기화
    }

    @Override
    public void signUp(HashMap<String, String> param) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        dao.signUp(param);
    }

    @Override
    public void memberModify(HashMap<String, String> param) {

        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        dao.memberModify(param);

    }

    @Override
    public void withdrawal(HashMap<String, String> param) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        dao.withdrawal(param);
    }
}
