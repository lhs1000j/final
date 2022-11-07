package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyDTO {
    //book_detail 테이블
    int book_id;
    String book_title;
    int book_price;
    String book_description;
    String book_author;
    String book_publisher;
    String id;
    int book_count;

    public int getBook_count() {
        return book_count;
    }

    public void setBook_count(int book_count) {
        this.book_count = book_count;
    }

    public BuyDTO(int book_id, String book_title, int book_price, String book_description, String book_author, String book_publisher, String id, int book_count) {
        this.book_id = book_id;
        this.book_title = book_title;
        this.book_price = book_price;
        this.book_description = book_description;
        this.book_author = book_author;
        this.book_publisher = book_publisher;
        this.id = id;
        this.book_count = book_count;
    }

    public BuyDTO() {}
}
