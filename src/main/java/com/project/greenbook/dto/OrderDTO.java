package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {
    int book_id;
    int book_price;
    String book_title;
    int book_count;
    int book_order_number;
    String member_id;
    String member_name;
    String member_phone;
    String member_email;
    int member_postcode;
    String member_address;
    String member_detailAddress;
    String member_extraAddress;

}
