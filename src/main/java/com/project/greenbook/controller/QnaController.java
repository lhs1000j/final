package com.project.greenbook.controller;

import com.project.greenbook.dto.MemberDTO;
import com.project.greenbook.dto.Paging;
import com.project.greenbook.dto.QnaDto;
import com.project.greenbook.service.MemberServiceImpl;
import com.project.greenbook.service.QnaServiceImpl;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class QnaController {
    @Autowired
    private QnaServiceImpl service;
    @Autowired
    private MemberServiceImpl memberService;

    //List 페이지
    @RequestMapping("/list")
    public String list(@RequestParam HashMap<String,String>  param, Model model, @RequestParam(defaultValue = "1")
                        int currentPage, @RequestParam(defaultValue = "qna_title") String searchOption){
        //List 목록 & Paging 처리 항목
        param.put("searchOption",searchOption);
        int startPage = (currentPage-1)*5;
        param.put("startPage", String.valueOf(startPage));
        ArrayList<QnaDto> list =service.qnaList(param);
        int total = service.countQna(param);
        //list 목록 불러오기
        model.addAttribute("list", list);
        //list paging 처리
        model.addAttribute("list2",new Paging(total,currentPage, 5, 5));


        return "qna/list";
    }
    // 글쓰기 페이지
    @RequestMapping("/write_view")
    public String write_view(HttpServletRequest request,@RequestParam HashMap<String,String> param, Model model){
        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");
        param.put("member_id",member_id);
        ArrayList<MemberDTO> member = memberService.loginCheck(param);
        model.addAttribute("member",member);
        return "qna/write_view";
    }

    //글쓰기
    @RequestMapping("/write")
    public String write(@RequestParam HashMap<String, String> param) {
        System.out.println("write()");
        service.write(param);

        return "redirect:/list";
    }
    // 글 작성된 페이지
    @RequestMapping("/content_view")
    public String content_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDto dto = service.contentView(param);
        model.addAttribute("content_view", dto);

        return "qna/content_view";
    }
    //수정 페이지
    @RequestMapping("/modify_view")
    public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDto dto = service.modifyView(param);
        model.addAttribute("content_view", dto);

        return "qna/modify_view";
    }
    //답변 페이지
    @RequestMapping("/reply_view")
    public String reply_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDto dto = service.replyView(param);
        model.addAttribute("content_view", dto);

        return "qna/reply_view";
    }
    //수정된페이지
    @RequestMapping("/modify")
    public String modify(@RequestParam HashMap<String, String> param) {

        service.modify(param);

        return "redirect:/list";
    }
    //삭제페이지
    @RequestMapping("/delete")
    public String delete(@RequestParam HashMap<String, String> param) {

        service.delete(param);
        return "redirect:/list";
    }


}
