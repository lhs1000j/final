package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Refund {
    private int refund_number;
    private int book_order_number;
    private int book_stock;
    private String refund_reason;
    private String refund_img;
    private String member_id;
}
