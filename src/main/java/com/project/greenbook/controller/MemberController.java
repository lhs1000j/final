package com.project.greenbook.controller;

import com.project.greenbook.dto.MemberDTO;
import com.project.greenbook.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@Log4j
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping("/login")
    public String login() {

        return "member/login";
    }

    @RequestMapping("/loginCheck")
    public String loginCheck(HttpServletRequest request, @RequestParam HashMap<String, String> param) {

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);
        String pw = param.get("member_pwd");
        HttpSession session = request.getSession();
        if (dtos.isEmpty()) {
            return "redirect:login";
        } else {
            if (pw.equals(dtos.get(0).getMember_pwd())) {
                session.setAttribute("member_id", param.get("member_id"));
                session.setAttribute("member_class", dtos.get(0).getMember_class());
                return "redirect:/";
            }
            return "redirect:login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        memberService.logout(session);
        return "redirect:/";
    }

    @RequestMapping("/signUp")
    public String signUp() {

        return "member/signup";
    }

    @RequestMapping("/signUpOk")
    public String signUpOk(@RequestParam HashMap<String, String> param) {
        memberService.signUp(param);

        return "redirect:login";
    }

    // 마이페이지
    @RequestMapping("/mypage")
    public String myPage(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        param.put("member_id", (String) session.getAttribute("member_id"));

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);
        model.addAttribute("memberInfo", dtos);

        return "member/mypage";
    }
    @RequestMapping("/memberModify")
    public String modify(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);
        model.addAttribute("memberInfo", dtos);

        return "member/modify";
    }
    @RequestMapping("/memberModifyUpdate")
    public String memberModify(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);
        model.addAttribute("memberInfo", dtos);

        memberService.memberModify(param);

        return "redirect:mypage";
    }
    @RequestMapping("/withdrawal")
    public String withdrawal(HttpServletRequest request, @RequestParam HashMap<String, String> param) {
        HttpSession session = request.getSession();
        param.put("member_id", (String) session.getAttribute("member_id"));
        memberService.withdrawal(param);
        return "redirect:login";
    }

}
