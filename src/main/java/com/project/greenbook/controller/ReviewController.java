package com.project.greenbook.controller;

import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.ReviewDTO;
import com.project.greenbook.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService service;

    @RequestMapping("/review")   //리스트
    public String review(HttpServletRequest request,@RequestParam String bookId,Model model) {
        System.out.println("리이이이이뷰");
        HttpSession session = request.getSession();
        String member_id = (String)session.getAttribute("member_id");
        session.setAttribute("member_id",member_id);
        System.out.println(member_id);
        ArrayList<ReviewDTO> review = service.review(bookId);
        model.addAttribute("review", review);
        model.addAttribute("book_id", bookId);
        System.out.println(bookId);
        BookDTO bookDetail = service.bookDetail(bookId);
        BookImgDTO bookImg = service.bookImg(bookId);
        model.addAttribute("bookDetail",bookDetail);
        model.addAttribute("bookImg",bookImg);

        int review_count = (int)service.review_count(bookId);
        double review_sum = (double)service.review_sum(bookId);
        double avg1 = review_sum/review_count;
        double avg = Math.round(avg1*10)/10.0;

        model.addAttribute("review_count",review_count);
        model.addAttribute("avg", avg);
        System.out.println("리ㅣ이이이이뷰끄ㅜㅌ");
        return "product/review";
    }

    @RequestMapping("/review_write") // 작성
    public String review_write(@RequestParam HashMap<String, String> param, HttpServletRequest request) {

        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("member_id");
        session.setAttribute("member_id", userId);

        service.review_write(param);
        String path = "redirect:review?bookId="+param.get("bookId");
        return path;
    }

   /* @RequestMapping("/writeResult")
    public String writeResult(@RequestParam HashMap<String, String> param) {
        System.out.println("writeResult()");
        service.write(param);

        return "redirect:review";
    }*/

}

