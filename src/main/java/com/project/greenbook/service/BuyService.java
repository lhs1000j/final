package com.project.greenbook.service;

import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BuyDTO;
import com.project.greenbook.dto.OrderDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface BuyService {
    public ArrayList<BuyDTO> cart(String member_id);
    public int cartCount(String member_id);
    public void cartAdd(HashMap<String, String> param);
    public void cartCountUpdate(HashMap<String, String> param);
    public void cancel(HashMap<String, String> param);

    public void orderAdd(HashMap<String, String> param);
    public void speedOrderAdd(HashMap<String, String> param);
    public void orderDelete(HashMap<String, String> param);

    public ArrayList<OrderDTO> orderList(HashMap<String, String> param);
    public ArrayList<OrderDTO> orderOkList(HashMap<String, String> param);
    public void updateCount(HashMap<String, String> param);

    public BookImgDTO contentImg(int bookId);
}
