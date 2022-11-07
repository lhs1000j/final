package com.project.greenbook.service;

import com.project.greenbook.dto.QnaDto;
import java.util.ArrayList;
import java.util.HashMap;

public interface QnaService {
    public ArrayList<QnaDto> list();
    public  void  write(HashMap<String, String> param);
    public QnaDto contentView(HashMap<String, String> param);
    public QnaDto modifyView(HashMap<String, String> param);
    public QnaDto replyView(HashMap<String, String> param);
    public void modify(HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
    public void upHit(HashMap<String, String> param);
    public int countQna(HashMap<String, String> param);
    public  ArrayList<QnaDto> qnaList(HashMap<String, String> param);

}
