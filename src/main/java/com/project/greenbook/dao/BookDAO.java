package com.project.greenbook.dao;

import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BookInfoDTO;
import com.project.greenbook.dto.Refund;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BookDAO {
    public List bookId1();
    public List bookId2();
    public List bookId3();
    public List bookId4();
    public List bookId5();
    public int bookCount(HashMap<String, String> param);
    public List bookIdList(HashMap<String, String> param);
    public List bookList(HashMap<String, String> param);
    public List bestSeller();
    public ArrayList<BookDTO> list();
    public void write (HashMap<String, String> param); // 매개변수의 타입을 HashMap으로 사용한다.
    public BookDTO contentView(HashMap<String, String> param);
    public void register(HashMap<String, String> param);
    public void registerUsed(HashMap<String,String> param);
    public void registerImg(HashMap<String, String> param);
    public int getMaxId();
    public void receiving(HashMap<String,String> param);
    public ArrayList<BookInfoDTO> bookInfoList(HashMap<String,String> param);
    public int countBookInfo(HashMap<String,String> param);
    public ArrayList<BookImgDTO> bookImgList(HashMap<String, String> param);
    public BookImgDTO contentImg(String bookId);
    public BookInfoDTO contentInfo(String bookId);
    public void updateInfo(HashMap<String, String> param);
    public void updateImg(HashMap<String, String> param);
    public void deleteInfo(String bookId);
    public void deleteImg(String bookId);
    public ArrayList<Refund> bookRefundList(String bookId);

    public String sellingCount(HashMap<String,String> param);
    public String stockOutCount(HashMap<String,String> param);
    public String refundCount(HashMap<String,String> param);
    public String randomBookId(int randomNum);
    public ArrayList<BookDTO> selectBook(HashMap<String,String> param);
    public void refund(HashMap<String, String> param);
    public int getMaxRefundNumber();
}
