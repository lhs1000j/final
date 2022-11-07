package com.project.greenbook.controller;

import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BookInfoDTO;
import com.project.greenbook.dto.Paging;
import com.project.greenbook.dto.bookIdListDTO;
import com.project.greenbook.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService service;

    @RequestMapping("/")
    public String index(@RequestParam HashMap<String,String> param,Model model){

        /* Main View */
        List<String> bookId1 = service.bookId1();
        List<String> bookId2 = service.bookId2();
        List<String> bookId3 = service.bookId3();
        List<String> bookId4 = service.bookId4();
        List<String> bookId5 = service.bookId5();
        HashMap<String,String> bookView1 = new HashMap();
        HashMap<String,String> bookView2 = new HashMap();
        HashMap<String,String> bookView3 = new HashMap();
        HashMap<String,String> bookView4 = new HashMap();
        HashMap<String,String> bookView5 = new HashMap();
        for (int i=0; i<4; i++){
            BookInfoDTO infoDTO = service.contentInfo(bookId1.get(i));
            BookImgDTO imgDTO = service.contentImg(bookId1.get(i));
            bookView1.put("bookId"+i, String.valueOf(infoDTO.getBookId()));
            bookView1.put("price"+i, String.valueOf(infoDTO.getBookPrice()));
            bookView1.put("title"+i, infoDTO.getBookTitle());
            bookView1.put("thumbnail"+i, imgDTO.getStoredThumbnail());
        }
        for (int i=0; i<4; i++){
            BookInfoDTO infoDTO = service.contentInfo(bookId2.get(i));
            BookImgDTO imgDTO = service.contentImg(bookId2.get(i));
            bookView2.put("bookId"+i, String.valueOf(infoDTO.getBookId()));
            bookView2.put("price"+i, String.valueOf(infoDTO.getBookPrice()));
            bookView2.put("title"+i, infoDTO.getBookTitle());
            bookView2.put("thumbnail"+i, imgDTO.getStoredThumbnail());
        }
        for (int i=0; i<4; i++){
            BookInfoDTO infoDTO = service.contentInfo(bookId3.get(i));
            BookImgDTO imgDTO = service.contentImg(bookId3.get(i));
            bookView3.put("bookId"+i, String.valueOf(infoDTO.getBookId()));
            bookView3.put("price"+i, String.valueOf(infoDTO.getBookPrice()));
            bookView3.put("title"+i, infoDTO.getBookTitle());
            bookView3.put("thumbnail"+i, imgDTO.getStoredThumbnail());
        }
        for (int i=0; i<4; i++){
            BookInfoDTO infoDTO = service.contentInfo(bookId4.get(i));
            BookImgDTO imgDTO = service.contentImg(bookId4.get(i));
            bookView4.put("bookId"+i, String.valueOf(infoDTO.getBookId()));
            bookView4.put("price"+i, String.valueOf(infoDTO.getBookPrice()));
            bookView4.put("title"+i, infoDTO.getBookTitle());
            bookView4.put("thumbnail"+i, imgDTO.getStoredThumbnail());
        }
        for (int i=0; i<4; i++){
            BookInfoDTO infoDTO = service.contentInfo(bookId5.get(i));
            BookImgDTO imgDTO = service.contentImg(bookId5.get(i));
            bookView5.put("bookId"+i, String.valueOf(infoDTO.getBookId()));
            bookView5.put("price"+i, String.valueOf(infoDTO.getBookPrice()));
            bookView5.put("title"+i, infoDTO.getBookTitle());
            bookView5.put("thumbnail"+i, imgDTO.getStoredThumbnail());
        }
        model.addAttribute("bookView1",bookView1);
        model.addAttribute("bookView2",bookView2);
        model.addAttribute("bookView3",bookView3);
        model.addAttribute("bookView4",bookView4);
        model.addAttribute("bookView5",bookView5);

        /* todayBook */
        int count = service.countBookInfo(param);
        int randomNum[] = new int[2];
        String[] randomId = new String[2];
        for(int i=0;i<2;i++) {
            randomNum[i] = (int)(Math.random() * count) + 1;
            for(int j=0;j<i;j++) {
                if(randomNum[i]==randomNum[j]) {
                    i--;
                }
            }
            randomId[i] = service.randomBookId(randomNum[i]);
        }

        BookInfoDTO todayInfo1 = service.contentInfo(randomId[0]);
        BookInfoDTO todayInfo2 = service.contentInfo(randomId[1]);
        BookImgDTO todayImg1 = service.contentImg(randomId[0]);
        BookImgDTO todayImg2 = service.contentImg(randomId[1]);

        model.addAttribute("todayInfo1", todayInfo1);
        model.addAttribute("todayInfo2", todayInfo2);
        model.addAttribute("todayImg1", todayImg1);
        model.addAttribute("todayImg2", todayImg2);

        /* bestSeller */
        List bookId = service.bestSeller();
        String[] bestBookId = new String[10];
        HashMap<String,String> bestSeller = new HashMap();
        for (int i=0; i<10; i++){
            bestBookId[i] = (String) bookId.get(i);
            BookInfoDTO bestInfo = service.contentInfo(bestBookId[i]);
            BookImgDTO bestImg = service.contentImg(bestBookId[i]);
            bestSeller.put("bookId"+i,String.valueOf(bestInfo.getBookId()));
            bestSeller.put("title"+i,bestInfo.getBookTitle());
            bestSeller.put("description"+i,bestInfo.getBookDescription());
            bestSeller.put("thumbnail"+i,bestImg.getStoredThumbnail());
            System.out.println(bestSeller);
        }
        model.addAttribute("best",bestSeller);
        return "index";
    }
    @RequestMapping("/book_list")
    public String bookList(Model model,@RequestParam HashMap<String,String> param){

        /* 목록 개수*/
        int count = service.bookCount(param);
        /* 한 페이지에 출력할 게시물의 개수 */
        int postNum = 10;
        /* 페이징 번호 [총 개수 / 한 페이지에 출력할 개수] */
        int pageNum = (int)Math.ceil((double)count/postNum);
        /* 출력할 게시물 */
        int page;
        if(param.get("page") == null){
            page = 1;
        } else {
            page = Integer.parseInt(param.get("page"));
        }
        int displayPost = (page - 1) * postNum;

        /* 데이터를 파라미터로 넘기기 위해 해시맵 사용 */
        HashMap<String, String> parameter = new HashMap();
        parameter.put("displayPost", String.valueOf(displayPost));
        parameter.put("postNum",String.valueOf(postNum));
        parameter.put("largeCategory",param.get("largeCategory"));

        if(param.containsKey("smallCategory")) {
            parameter.put("smallCategory",param.get("smallCategory"));
        }
        if(param.containsKey("searchType")){
            parameter.put("searchType",param.get("searchType"));
            parameter.put("searchName",param.get("searchName"));
        }
        if(param.containsKey("title")){
            parameter.put("title",param.get("title"));
            parameter.put("author",param.get("author"));
            model.addAttribute("title",param.get("title"));
            model.addAttribute("author",param.get("author"));
        }

        List list = service.bookList(parameter);
        List bookIdList = service.bookIdList(parameter);
        HashMap<String, String> imgList = new HashMap<>();
        for (int i=0; i<bookIdList.size(); i++){
            BookImgDTO imgDTO = service.contentImg((String) bookIdList.get(i));
            imgList.put("thumbnail"+i, imgDTO.getStoredThumbnail());
            System.out.println(imgList);
        }
        model.addAttribute("list",list);
        model.addAttribute("imgList",imgList);
        model.addAttribute("pageNum",pageNum);
        model.addAttribute("page",page);
        model.addAttribute("largeCategory",param.get("largeCategory"));
        model.addAttribute("smallCategory",param.get("smallCategory"));
        model.addAttribute("searchType",param.get("searchType"));
        model.addAttribute("searchName",param.get("searchName"));

        return "book_list";
    }
    @RequestMapping("/chat")
    public String chat(){return "chat";}


    @RequestMapping("/new_book_list")
    public String newBookList(){

        return "new_book/new_book_list";
    }

    //    =========================================================================================================
//    =========================================================================================================
//    =========================================================================================================
    /*
     * 2022-11-03
     * 이민하 : 수정
     * */
    @RequestMapping("/product")
    public String product(HttpServletRequest request, @RequestParam HashMap<String,String> param,Model model, @RequestParam(defaultValue = "1") int currentPage){
        HttpSession session = request.getSession();
        String url = String.valueOf(request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE));

        //<<<<==================== 여기 수정 2022-11-03=======================================

        String member_class = String.valueOf(session.getAttribute("member_class"));


        //==================== 여기 수정 2022-11-03=======================================>>>>

        //한 페이지의 행의 개수
        int size = 5;
        //이전과 다음 사이의 페이지 수
        int pagingCount = 3;
        System.out.println("@@@### BookController.productManager() start");

        if(session.getAttribute("member_id") == null){
            return "redirect:/loginCheck";
        }else{
            param.put("start",String.valueOf((currentPage-1)*size));
            param.put("size",String.valueOf(size));
            param.put("member_id",String.valueOf(session.getAttribute("member_id")));
            param.put("member_class",member_class);
            System.out.println("member_class = " + param.get("member_class"));
            System.out.println("member_id = " + param.get("member_id"));

            ArrayList<BookInfoDTO> bookInfoList = service.bookInfoList(param);
            ArrayList<String> statusList = service.productStatus(param);


            int total = service.countBookInfo(param);

            System.out.println(total);

            model.addAttribute("bookInfoList",bookInfoList);
            model.addAttribute("list",new Paging(total,currentPage, pagingCount, size));
            model.addAttribute("searchOption",param.get("searchOption"));
            model.addAttribute("searchText",param.get("searchText").replace("%",""));
            model.addAttribute("productStatus",statusList);

            System.out.println("@@@### BookController.productManager() end");

            return "product/product";
        }
    }

    /*
     * 2022-11-03
     * 이민하 : 수정
     * */
    @RequestMapping("/product_manager")
    public String productManager(HttpServletRequest request,@RequestParam HashMap<String,String> param, Model model, @RequestParam(defaultValue = "1") int currentPage){
        HttpSession session = request.getSession();

        //<<<<==================== 여기 수정 2022-11-03=======================================


        String member_class = String.valueOf(session.getAttribute("member_class"));


        //==============================================================================>>>>
        //<<<<==================== 여기 수정 2022-11-03=======================================
        //로그인이 안되어있으면 로그인으로 보냄.

        if(session.getAttribute("member_id")==null){
            return "redirect:/loginCheck";
        }else{
            //한 페이지의 행의 개수
            int size = 5;
            //이전과 다음 사이의 페이지 수
            int pagingCount = 3;
            System.out.println("@@@### BookController.productManager() start");
            param.put("start",String.valueOf((currentPage-1)*size));
            param.put("size",String.valueOf(size));
            param.put("member_id",String.valueOf(session.getAttribute("member_id")));
            //<<<<==================== 여기 수정 2022-11-03=======================================


            param.put("member_class",member_class);


            //================================================================================>>>>

            ArrayList<BookInfoDTO> bookInfoList = service.bookInfoList(param);
            ArrayList<BookImgDTO> bookImgDTOS = service.bookImgList(param);
            int total = service.countBookInfo(param);
            System.out.println(total);

            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            model.addAttribute("bookInfoList",bookInfoList);
            model.addAttribute("bookImgList", bookImgDTOS);
            model.addAttribute("list",new Paging(total,currentPage, pagingCount, 5));
            model.addAttribute("searchOption",param.get("searchOption"));
            model.addAttribute("searchText",param.get("searchText").replace("%",""));
            model.addAttribute("sdf",sdf);

            if(param.get("bookId")!=null){
                System.out.println("bookId = " + param.get("bookId"));
                BookInfoDTO bookInfoDTO = service.contentInfo(param.get("bookId"));
                BookImgDTO bookImgDTO = service.contentImg(param.get("bookId"));

                model.addAttribute("bookInfo2",bookInfoDTO);
                model.addAttribute("bookImg2", bookImgDTO);
                System.out.println("bookId2 = "+bookInfoDTO.getBookId());
            }

            System.out.println("@@@### BookController.productManager() end");

        }
        //==============================================================================>>>>
        return "product/product_manager";
    }

    /*
     * 이름 : 이민하
     * 작업 : 2022.10.25  책정보, 이미지, 섬네일 업로드 컨트롤러
     * */
    /*
     * 2022-11-03
     * 이민하 : 수정
     * */
    @RequestMapping("/product_uploadOk")
    public String upload(@RequestParam("imgfile")MultipartFile uploadFile, HttpServletRequest request,@RequestParam HashMap<String, String> param){
        System.out.println("@@@### BookController.upload() start");

        //<<<<==================== 여기 수정 2022-11-03=======================================
        //session 추가됨.

        HttpSession session = request.getSession();
        param.put("member_class",String.valueOf(session.getAttribute("member_class")));
        param.put("member_id",String.valueOf(session.getAttribute("member_id")));
        param.put("new_book",String.valueOf((int)session.getAttribute("member_class")-1));


        //=============================================================================>>>>

        service.register(uploadFile ,request, param);

        System.out.println("@@@### BookController.upload() end");

        return "redirect:product_manager";
    }


    @RequestMapping("/product_upload")
    public String productUpload(HttpServletRequest request, HashMap<String,String> param){
        HttpSession session = request.getSession();
        param.put("member_id", (String) session.getAttribute("member_id"));

        if(session.getAttribute("member_id")==null){
            return "redirect:/loginCheck";
        }
        return "product/product_upload";
    }

    @RequestMapping("/product_update")
    public String productUpdate(@RequestParam("imgfile")MultipartFile uploadFile, HttpServletRequest request,@RequestParam HashMap<String, String> param){
        System.out.println("@@@### BookController.upload() start");

        if(uploadFile.getName() == null){
            service.updateInfo(param);
        }else{
            service.updateInfoAndImg(uploadFile,request,param);
        }

        System.out.println("@@@### BookController.upload() end");

        return "redirect:product_manager";
    }

    @RequestMapping("/product_deleteOk")
    public String productDelete(@RequestParam HashMap<String,String> param, HttpServletRequest request){
        if(request.getHeader("REFERER")==null){
            return "redirect:/";
        }else{
            System.out.println("@@@### BookController.upload() start");

            String url = String.valueOf(request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE));
            service.deleteInfo(param, request);

            System.out.println("@@@### BookController.upload() end");

            return "redirect:product_manager";
        }
    }

    //================ 2022-11-03 requestMapping 수정 ===========================
    @RequestMapping("/product_receiving")
    public String productReceiving(HttpServletRequest request, @RequestParam HashMap<String,String> param){
        System.out.println("@@@### BookController.upload() start");

        service.receiving(param);

        System.out.println("@@@### BookController.upload() end");
        return "redirect:product";
    }

    @RequestMapping("product_extended_period")
    public String extentedPeriod(HttpServletRequest request){
        HttpSession session = request.getSession();

        if(session.getAttribute("member_id")==null){
            return "redirect:/loginCheck";
        }

        return "product/product_extended_period";
    }

    @RequestMapping("product_refund")
    public String bookRefund(@RequestParam String bookId,HttpServletRequest request,Model model){
        HttpSession session = request.getSession();

        if(session.getAttribute("member_id")==null){
            return "redirect:/loginCheck";
        }

        model.addAttribute("refundList",service.bookRefundList(bookId));
        return "product/product_refund";
    }

    @RequestMapping("refund")
    public String refund(){

        return "product/refund";
    }

    @RequestMapping("refundOk")
    public String refundOk(@RequestParam("imgfile")MultipartFile uploadFile, HttpServletRequest request,@RequestParam HashMap<String, String> param){
        System.out.println("@@@### BookController.refundOk() start");
        HttpSession session = request.getSession();


        param.put("member_class",String.valueOf(session.getAttribute("member_class")));
        param.put("member_id",String.valueOf(session.getAttribute("member_id")));
        service.register(uploadFile ,request, param);


        System.out.println("@@@### BookController.refundOk() start");
        return "/";
    }

}
