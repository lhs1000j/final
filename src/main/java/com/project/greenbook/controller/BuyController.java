package com.project.greenbook.controller;

import com.project.greenbook.dto.*;
import com.project.greenbook.service.BookService;
import com.project.greenbook.service.BuyService;
import com.project.greenbook.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class BuyController {
    @Autowired
    private BuyService service;
    @Autowired
    private MemberService memberService;

    @Autowired
    private BookService bookService;

    @RequestMapping("/order")
    public String order(HttpServletRequest request, @RequestParam HashMap<String,String> param, Model model) {
        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");

        param.put("member_id",member_id);
        ArrayList<BuyDTO> cart = service.cart(member_id);
        model.addAttribute("cartInfo", cart);
        int count = service.cartCount(member_id);
        int[] bookId = new int[count];
        HashMap<String,String> cartImg = new HashMap<>();
        for (int i = 0; i<count; i++){
            bookId[i] = cart.get(i).getBook_id();
            BookImgDTO bookImg = service.contentImg(bookId[i]);
//            cartImg.put("thumbnail"+i,bookImg.getStoredThumbnail());
        }

        ArrayList<MemberDTO> member = memberService.loginCheck(param);
        model.addAttribute("memberInfo",member);
        model.addAttribute("cartImg",cartImg);
        model.addAttribute("totalMoney",param.get("totalMoney"));
        return "/buy/order";
    }

    @RequestMapping("/speedOrder")
    public String speedOrder(HttpServletRequest request, @RequestParam HashMap<String,String> param, Model model) {
        System.out.println("바로주문테스트~~");
        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");

        param.put("member_id",member_id);
        ArrayList<BookDTO> bookDTOS = bookService.selectBook(param);
//        System.out.println(param.put("book_id",String.valueOf(bookDTOS.get(0).getBook_id())));
        param.put("book_id",String.valueOf(bookDTOS.get(0).getBook_id()));
        param.put("book_price", String.valueOf(bookDTOS.get(0).getBook_price()));
        param.put("book_title",bookDTOS.get(0).getBook_title());
        param.put("book_author",bookDTOS.get(0).getBook_author());
        param.put("book_publisher",bookDTOS.get(0).getBook_publisher());
        param.put("book_description",bookDTOS.get(0).getBook_description());
        ArrayList<MemberDTO> memberDTOS = memberService.loginCheck(param);
        model.addAttribute("memberInfo",memberDTOS);
        session.setAttribute("book_id",param.get("book_id"));
        session.setAttribute("book_price",param.get("book_price"));
        session.setAttribute("book_title",param.get("book_title"));
        session.setAttribute("book_author",param.get("book_author"));
        session.setAttribute("book_publisher",param.get("book_publisher"));
        session.setAttribute("book_description",param.get("book_description"));
        int count = 1;
        int[] bookId = new int[count];
        HashMap<String,String> cartImg = new HashMap<>();

            bookId[0] = bookDTOS.get(0).getBook_id();
            BookImgDTO bookImg = service.contentImg(bookId[0]);
            cartImg.put("thumbnail"+0,bookImg.getStoredThumbnail());

            param.put("cartImg",cartImg.put("thumbnail"+0,bookImg.getStoredThumbnail()));


        ArrayList<MemberDTO> member = memberService.loginCheck(param);
        model.addAttribute("memberInfo",member);
        model.addAttribute("cartImg",cartImg);
        model.addAttribute("totalMoney",param.get("totalMoney"));
        return "/buy/speedOrder";
    }

    @RequestMapping("/cart")
    public String cart(HttpServletRequest request, @RequestParam HashMap<String, String> param,Model model) {
        HttpSession session = request.getSession();

        String member_id = (String) session.getAttribute("member_id");
        param.put("member_id",member_id);

        ArrayList<BuyDTO> cart = service.cart(member_id);
        model.addAttribute("cart", cart);
        int count = service.cartCount(member_id);
        int[] bookId = new int[count];
        HashMap<String,String> cartImg = new HashMap<>();
        for (int i = 0; i<count; i++){
            bookId[i] = cart.get(i).getBook_id();
            BookImgDTO bookImg = service.contentImg(bookId[i]);
//            cartImg.put("thumbnail"+i,bookImg.getStoredThumbnail());
        }

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);

        model.addAttribute("memberInfo",dtos);
        model.addAttribute("cartImg",cartImg);

        return "/buy/cart";
    }

    @RequestMapping("/cartAdd")
    public String cartAdd(HttpServletRequest request,@RequestParam HashMap<String, String> param){
        HttpSession session = request.getSession();
        String member_id = (String)session.getAttribute("member_id");
        System.out.println(member_id);

        ArrayList<BookDTO> bookDTOS = bookService.selectBook(param);
        param.put("book_price", String.valueOf(bookDTOS.get(0).getBook_price()));
        param.put("book_title",bookDTOS.get(0).getBook_title());
        param.put("book_author",bookDTOS.get(0).getBook_author());
        param.put("book_publisher",bookDTOS.get(0).getBook_publisher());
        param.put("book_description",bookDTOS.get(0).getBook_description());

        ArrayList<MemberDTO> memberDTOS = memberService.loginCheck(param);
        param.put("member_id",member_id);
        service.cartAdd(param);
        return "redirect:cart";
    }

    @RequestMapping("/cartCountUpdate")
    public String cartCountUpdate(@RequestParam HashMap<String, String> param) {
        service.cartCountUpdate(param);
        return "redirect:cart";
    }


    @RequestMapping("/cancel")
    public String cancel(@RequestParam HashMap<String, String> param, Model model) {
        System.out.println("@@@cancel");
        service.cancel(param);

        return "redirect:cart";
    }

    @RequestMapping("/kakaoPay")
    public String kakaoPay(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));

        ArrayList<BuyDTO> cart = service.cart((String) session.getAttribute("member_id"));
        model.addAttribute("cart", cart);

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);

        model.addAttribute("memberInfo",dtos);

        return "/buy/kakaoPay";
    }
    @RequestMapping("/speedOrderKakaoPay")
    public String speedOrderKakaoPay(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));

        ArrayList<BookDTO> bookDTOS = bookService.selectBook(param);
        param.put("book_id",String.valueOf(bookDTOS.get(0).getBook_id()));
        param.put("book_price", String.valueOf(bookDTOS.get(0).getBook_price()));
        param.put("book_title",bookDTOS.get(0).getBook_title());
        param.put("book_author",bookDTOS.get(0).getBook_author());
        param.put("book_publisher",bookDTOS.get(0).getBook_publisher());
        param.put("book_description",bookDTOS.get(0).getBook_description());
        ArrayList<MemberDTO> memberDTOS = memberService.loginCheck(param);
        model.addAttribute("memberInfo",memberDTOS);
        session.setAttribute("book_id",param.get("book_id"));
        session.setAttribute("book_price",param.get("book_price"));
        session.setAttribute("book_title",param.get("book_title"));
        session.setAttribute("book_author",param.get("book_author"));
        session.setAttribute("book_publisher",param.get("book_publisher"));
        session.setAttribute("book_description",param.get("book_description"));


        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);

        model.addAttribute("memberInfo",dtos);

        return "/buy/speedOrderKakaoPay";
    }

    @RequestMapping("/orderAdd")
    public String orderAdd(@RequestParam HashMap<String, String> param,Model model, @RequestParam("book_id") ArrayList<String> bookIdlist, HttpServletRequest request) {
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));

        ArrayList<OrderDTO> orderList = service.orderList(param);
        model.addAttribute("orderList",orderList);
        service.orderAdd(param);
        String order_date = param.get("order_date");
        System.out.println(order_date);

        for (String bookId:bookIdlist
        ) {
            System.out.println(bookId);
            param.put("book_id",bookId);
            service.updateCount(param);
        }
        String path = "redirect:orderOk";
        return path;
    }
    @RequestMapping("/speedOrderAdd")
    public String speedOrderAdd(@RequestParam HashMap<String, String> param,Model model, @RequestParam("book_id") ArrayList<String> bookIdlist, HttpServletRequest request) {
        System.out.println("speedOrderTeststart~~!@~!@!~~@");
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));
        System.out.println(param);

        ArrayList<OrderDTO> orderList = service.orderList(param);
        model.addAttribute("orderList",orderList);
        service.speedOrderAdd(param);
        System.out.println(param);
        String order_date = param.get("order_date");
        System.out.println(order_date);

        for (String bookId:bookIdlist
        ) {
            System.out.println(bookId);
            param.put("book_id",bookId);
            service.updateCount(param);
        }
        String path = "redirect:speedOrderOk";
        System.out.println("speedOrderTest~~!@~!@!~~@");
        return path;
    }

    @RequestMapping("/buyOk")
    public String buyOk(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        System.out.println((String) session.getAttribute("book_id"));
        param.put("member_id",(String) session.getAttribute("member_id"));
        param.put("book_id",(String) session.getAttribute("book_id"));

        ArrayList<OrderDTO> orderList = service.orderList(param);
        model.addAttribute("orderList",orderList);

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);

        model.addAttribute("memberInfo",dtos);

        return "/buy/buyOk";
    }
    @RequestMapping("/orderDelete")
    public String orderDelete(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
        System.out.println("orderDeleteStart");
        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));
        String number = (String)session.getAttribute("book_order_number");
        System.out.println(param);
//        String book_id = (String)session.getAttribute("book_id");
//        System.out.println(book_id);
        service.orderDelete(param);
        String order_date = param.get("book_order_number");
        String path = "redirect:buyOk";
        System.out.println("orderDeleteAnd");
        return path;
    }

    @RequestMapping("/orderOk")
    public String orderOk(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {

        ArrayList<OrderDTO> orderOkList = service.orderOkList(param);
        model.addAttribute("orderOkList",orderOkList);

        HttpSession session = request.getSession();
        param.put("member_id",(String) session.getAttribute("member_id"));
        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);

        model.addAttribute("memberInfo",dtos);

        return "/buy/orderOk";
    }
    @RequestMapping("/speedOrderOk")
    public String speedOrderOk(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
        HttpSession session = request.getSession();
        param.put("book_id", (String) session.getAttribute("book_id"));

        ArrayList<BookDTO> bookDTOS = bookService.selectBook(param);
        param.put("book_price", String.valueOf(bookDTOS.get(0).getBook_price()));
        param.put("book_title",bookDTOS.get(0).getBook_title());
        param.put("book_author",bookDTOS.get(0).getBook_author());
        param.put("book_publisher",bookDTOS.get(0).getBook_publisher());
        param.put("book_description",bookDTOS.get(0).getBook_description());
        ArrayList<MemberDTO> memberDTOS = memberService.loginCheck(param);
        model.addAttribute("memberInfo",memberDTOS);
        session.setAttribute("book_id",param.get("book_id"));
        session.setAttribute("book_price",param.get("book_price"));
        session.setAttribute("book_title",param.get("book_title"));
        session.setAttribute("book_author",param.get("book_author"));
        session.setAttribute("book_publisher",param.get("book_publisher"));
        session.setAttribute("book_description",param.get("book_description"));

//        ArrayList<OrderDTO> orderOkList = service.orderOkList(param);
//        model.addAttribute("orderOkList",orderOkList);

//
        param.put("member_id",(String) session.getAttribute("member_id"));
        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);

        model.addAttribute("memberInfo",dtos);

        return "/buy/speedOrderOk";
    }
}
