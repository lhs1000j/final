package com.project.greenbook.service;

import com.project.greenbook.dto.MemberDTO;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

public interface MemberService {
    public ArrayList<MemberDTO> loginCheck(HashMap<String, String> param);
    public void logout(HttpSession session);
    public void signUp(HashMap<String, String> param);
    public void memberModify(HashMap<String, String> param);
    public void withdrawal(HashMap<String, String> param);


}
