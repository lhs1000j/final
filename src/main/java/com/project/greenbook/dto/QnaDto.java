package com.project.greenbook.dto;

import java.sql.Timestamp;

public class QnaDto {
    private int qna_id ;
    private String qna_name ;
    private String qna_title ;
    private String qna_content ;
    private Timestamp qna_date ;
    private int qna_hit;
    private int qna_ref;
    private int qna_step;

    public QnaDto(int qna_id, String qna_name, String qna_title, String qna_content,
                  Timestamp qna_date, int qna_hit, int qna_ref, int qna_step, int qna_level) {
        this.qna_id = qna_id;
        this.qna_name = qna_name;
        this.qna_title = qna_title;
        this.qna_content = qna_content;
        this.qna_date = qna_date;
        this.qna_hit = qna_hit;
        this.qna_ref = qna_ref;
        this.qna_step = qna_step;
        this.qna_level = qna_level;
    }

    public int getQna_id() {
        return qna_id;
    }
    public void setQna_id(int qna_id) {
        this.qna_id = qna_id;
    }
    public String getQna_name() {
        return qna_name;
    }
    public void setQna_name(String qna_name) {
        this.qna_name = qna_name;
    }
    public String getQna_title() {
        return qna_title;
    }
    public void setQna_title(String qna_title) {
        this.qna_title = qna_title;
    }
    public String getQna_content() {
        return qna_content;
    }
    public void setQna_content(String qna_content) { this.qna_content = qna_content; }
    public Timestamp getQna_date() {
        return qna_date;
    }
    public void setQna_date(Timestamp qna_date) {
        this.qna_date = qna_date;
    }
    public int getQna_hit() {
        return qna_hit;
    }
    public void setQna_hit(int qna_hit) {
        this.qna_hit = qna_hit;
    }
    public int getQna_ref() {
        return qna_ref;
    }
    public void setQna_ref(int qna_ref) {
        this.qna_ref = qna_ref;
    }
    public int getQna_step() {
        return qna_step;
    }
    public void setQna_step(int qna_step) {
        this.qna_step = qna_step;
    }
    public int getQna_level() {
        return qna_level;
    }
    public void setQna_level(int qna_level) {
        this.qna_level = qna_level;
    }
    private int qna_level;

    public QnaDto(){}
}
