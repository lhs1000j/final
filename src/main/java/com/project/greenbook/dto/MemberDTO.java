package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
public class MemberDTO {

    private String member_id;
    private String member_pwd;
    private String member_name;
    private String member_phone;
    private String member_email;
    private String member_postcode;
    private String member_address;
    private String member_detailAddress;
    private String member_extraAddress;
    private int member_class;
}