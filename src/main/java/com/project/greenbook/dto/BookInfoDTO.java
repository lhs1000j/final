package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
public class BookInfoDTO {
    private int bookId;
    private String bookTitle;
    private String largeCategory;
    private String smallCategory;
    private int bookPrice;
    private String bookAuthor;
    private String bookPublisher;
    private String bookDescription;
    private Timestamp publicationDate;
    private int bookStock;
    private int newBook;
    private String filePath;

}