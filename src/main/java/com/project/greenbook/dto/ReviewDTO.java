package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class ReviewDTO {
    int review_num;
    int book_id;
    String member_id;
    String review_text;
    int review_score;
    Timestamp review_date;
    int review_sum;
    int review_count;
}
