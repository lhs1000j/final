package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookImgDTO {
    private int bookId;
    private String originFileName;
    private String storedFileName;
    private String storedThumbnail;
    private int fileSize;
}
