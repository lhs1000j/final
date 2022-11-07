package com.project.greenbook.dao;

import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.ReviewDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface ReviewDAO {
    public ArrayList<ReviewDTO> review(String bookId);
    public void review_write (HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
    public int review_count(String bookId);
    public int review_sum(String bookId);
    public BookDTO bookDetail(String bookId);
    public BookImgDTO bookImg(String bookId);
}
