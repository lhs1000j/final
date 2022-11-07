package com.project.greenbook.service;

import com.project.greenbook.dao.BookDAO;
import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BookInfoDTO;
import com.project.greenbook.dto.Refund;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.UUID;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public String randomBookId(int randomNum){
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        String bookId = dao.randomBookId(randomNum);
        return bookId;
    }

//    @Autowired
//    PlatformTransactionManager transactionManager;
//
//    public void setTransactionManager(PlatformTransactionManager transactionManager) {
//        this.transactionManager = transactionManager;
//    }
@Override
public List bookId1() {
    BookDAO dao = sqlSession.getMapper(BookDAO.class);
    List bookId = dao.bookId1();
    return bookId;
}

    @Override
    public List bookId2() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId2();
        return bookId;
    }

    @Override
    public List bookId3() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId3();
        return bookId;
    }

    @Override
    public List bookId4() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId4();
        return bookId;
    }

    @Override
    public List bookId5() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId5();
        return bookId;
    }

    @Override
    public int bookCount(HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        int count = dao.bookCount(param);
        return count;
    }

    @Override
    public List bookIdList(HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookIdList = dao.bookIdList(param);
        return bookIdList;
    }

    /* 게시물 목록 + 페이징 */
    @Override
    public List bookList(HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookList = dao.bookList(param);
        return bookList;
    }

    @Override
    public List bestSeller() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bestSeller = dao.bestSeller();
        return bestSeller;
    }
    /*
    * 이름 : 이민하
    * 작업 : 2022.10.25 책정보, 이미지, 섬네일 업로드 메소드 작성, 트랜잭션 적용
    * 오류 : 트랜잭션 => nullPointException 로 인해서 제거
    * */
    /*
     * 이름 : 이민하
     * 작업 : 2022.10.25 책정보, 이미지, 섬네일 업로드 메소드 작성, 트랜잭션 적용
     * 오류 : 트랜잭션 => nullPointException 로 인해서 제거
     *
     * 2022-11-03
     * 이민하 : 수정
     * */
    @Override
    @Transactional
    public void register(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param) {
        System.out.println("========BookServiceImpl.register() start");

        UUID uuid = UUID.randomUUID();

        String fileName = uploadFile.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
        String storedFileName = uuid + "_" + fileName;
        String thumbNailName = "s_"+storedFileName;


        System.out.println("@#@#@#@#@#@ 여기222");
        System.out.println("fileName"+fileName);
        System.out.println("storedFileName"+storedFileName);

        param.put("originFileName",fileName);
        param.put("storedFileName", storedFileName);
        param.put("storedThumbnail",thumbNailName);
        param.put("fileSize", String.valueOf(uploadFile.getSize()));

        if(param.get("adultYN") == null){
            param.put("adultYN","N");
        }else{
            param.put("adultYN","Y");
        }

        try{
            File saveFile = new File(filePath + storedFileName);
            System.out.println(saveFile.getName());
            uploadFile.transferTo(saveFile);
            System.out.println("이미지 파일 저장 완료");

            File thumbNailFile = new File(filePath +"s_"+ storedFileName);
            BufferedImage bo_img = ImageIO.read(saveFile);

            int width = 200;
            int height = 300;

            BufferedImage btImg = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphic = btImg.createGraphics();
            graphic.drawImage(bo_img,0,0, width,height,null);
            ImageIO.write(btImg,"jpg", thumbNailFile);

            //여기 있는 것을 아래로 이동시킴.

        }catch (Exception e){

            e.printStackTrace();
        }
        //<<<<==================== 여기 수정 2022-11-03=======================================
        //try 문에서 밖으로 빠져나옴

        BookDAO dao = sqlSession.getMapper(BookDAO.class);

        dao.register(param);
        param.put("bookId",String.valueOf(dao.getMaxId()));
        dao.registerUsed(param);// => 추가됨.

        dao.registerImg(param);

        //=============================================================================>>>>
        System.out.println("========BookServiceImpl.register() end");
    }

    public void receiving(HashMap<String,String> param){
        System.out.println("========BookServiceImpl.receiving() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        dao.receiving(param);

        System.out.println("========BookServiceImpl.receiving() end");
    }

    @Override
    public ArrayList<BookInfoDTO> bookInfoList(HashMap<String,String> param) {
        System.out.println("========BookServiceImpl.bookInfoList() start");

        String searchOption = param.get("searchOption");
        String searchText = param.get("searchText");

        if(searchOption == null){
            searchOption = "book_id";
        }
        if(searchText == null){
            searchText = "";
        }
//        searchText = "%"+searchText+"%";

        if(searchOption.equals("bookTitle")){
            searchOption = "book_title";
        } else{
            searchOption = "book_id";
        }

        System.out.println("searchOption = "+searchOption);
        System.out.println("searchText = "+searchText);

        param.put("searchOption",searchOption);
        param.put("searchText",searchText);

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        ArrayList<BookInfoDTO> bookInfoList = dao.bookInfoList(param);

        System.out.println("========BookServiceImpl.bookInfoList() end");
        return bookInfoList;
    }

    @Override
    public int countBookInfo(HashMap<String,String> param) {
        System.out.println("========BookServiceImpl.countBookInfo() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        int count = dao.countBookInfo(param);

        System.out.println("========BookServiceImpl.countBookInfo() end");
        return count;
    }

    @Override
    public ArrayList<BookImgDTO> bookImgList(HashMap<String, String> param) {
        System.out.println("========BookServiceImpl.bookImgList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        ArrayList<BookImgDTO> daos = dao.bookImgList(param);

        System.out.println("========BookServiceImpl.bookImgList() end");
        return daos;
    }

    @Override
    public BookImgDTO contentImg(String bookId) {
        System.out.println("========BookServiceImpl.bookImgList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        BookImgDTO bto = dao.contentImg(bookId);

        System.out.println("========BookServiceImpl.bookImgList() end");
        return bto;
    }

    @Override
    public BookInfoDTO contentInfo(String bookId) {
        System.out.println("========BookServiceImpl.bookImgList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        BookInfoDTO bto = dao.contentInfo(bookId);

        System.out.println("========BookServiceImpl.bookImgList() end");
        return bto;
    }

    @Override
    public void updateInfo(HashMap<String, String> param) {
        System.out.println("========BookServiceImpl.updateInfo() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        dao.updateInfo(param);

        System.out.println("========BookServiceImpl.updateInfo() end");
    }

    @Override
    @Transactional
    public void updateInfoAndImg(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param) {
        System.out.println("========BookServiceImpl.updateInfoAndImg() start");

        System.out.println(param.get("bookTitle"));

        UUID uuid = UUID.randomUUID();

        System.out.println("@@@@@@@@@여기1");

        String fileName = uploadFile.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
        String storedFileName = uuid + "_" + fileName;
        String thumbNailName = "s_"+storedFileName;


        System.out.println("@#@#@#@#@#@ 여기222");
        System.out.println("fileName = "+fileName);
        System.out.println("storedFileName = "+storedFileName);

        param.put("originFileName",fileName);
        param.put("storedFileName", storedFileName);
        param.put("storedThumbnail",thumbNailName);
        param.put("fileSize", String.valueOf(uploadFile.getSize()));

        try{
            File saveFile = new File(filePath + storedFileName);
            System.out.println(saveFile.getName());
            uploadFile.transferTo(saveFile);
            System.out.println("이미지 파일 저장 완료");

            deleteImgFile(param.get("bookId"), filePath);

            File thumbNailFile = new File(filePath +"s_"+ storedFileName);
            BufferedImage bo_img = ImageIO.read(saveFile);

            int width = 200;
            int height = 300;

            BufferedImage btImg = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphic = btImg.createGraphics();
            graphic.drawImage(bo_img,0,0, width,height,null);
            ImageIO.write(btImg,"jpg", thumbNailFile);

            /*BookDAO dao = sqlSession.getMapper(BookDAO.class);
            dao.updateInfo(param);
            dao.updateImg(param);*/

        }catch (Exception e){

            e.printStackTrace();
        }
        //==================== 2022-11-03 여기 수정 =======================
        //위에서 아래로 이동, try 문 밖으로 빠져나옴
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        dao.updateInfo(param);
        dao.updateImg(param);

        //===================================================================

        System.out.println("========BookServiceImpl.updateInfoAndImg() end");
    }
    @Override
    @Transactional
    public void deleteInfo(HashMap<String,String> param, HttpServletRequest request){
        System.out.println("=======BookServiceImpl.deleteInfo() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        String filePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
        String bookId = param.get("bookId");
        System.out.println("bookId = "+ bookId);
        System.out.println("filePath = "+filePath);

        try {
            deleteImgFile(bookId,filePath);
            dao.deleteImg(bookId);
            dao.deleteInfo(bookId);

        }catch (Exception e){
            e.printStackTrace();
        }

        System.out.println("========BookServiceImpl.deleteInfo() end");

    }

    public void deleteImgFile(String bookId, String filePath){

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        BookImgDTO dto = dao.contentImg(bookId);
        System.out.println("##%%@@ 파일경로 == "+filePath+dto.getStoredThumbnail());
        File file = new File(filePath+dto.getStoredFileName());
        if(file.delete()){
            System.out.println("@@@!!! 기본파일 삭제 완료");
        } else{
            System.out.println("@@@!!! 기본파일이 없습니다.");
        }

        File thumbnail = new File(filePath+dto.getStoredThumbnail());
        if(thumbnail.delete()){
            System.out.println("@@@!!! 썸네일파일 삭제 완료");
        } else{
            System.out.println("@@@!!! 썸네일파일이 없습니다.");
        }
    }


    @Override
    public ArrayList<Refund> bookRefundList(String bookId) {
        System.out.println("=======BookServiceImpl.bookRefundList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        ArrayList<Refund> dtos = dao.bookRefundList(bookId);

        System.out.println("========BookServiceImpl.bookRefundList() end");
        return dtos;
    }

    @Override
    public ArrayList<String> productStatus(HashMap<String,String> param){
        System.out.println("=======BookServiceImpl.bookRefundList() start");

        ArrayList<String> list = new ArrayList<>();

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        list.add(dao.sellingCount(param));
        list.add(dao.stockOutCount(param));
        list.add(dao.refundCount(param));

        System.out.println("========BookServiceImpl.bookRefundList() end");


        return list;
    }
    @Override
    public ArrayList<BookDTO> selectBook(HashMap<String, String> param) {
        BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
        ArrayList<BookDTO> SelectBook = bookDAO.selectBook(param);
        return SelectBook;
    }

    @Override
    @Transactional
    public void refund(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param) {
        System.out.println("========BookServiceImpl.refund() start");

        UUID uuid = UUID.randomUUID();

        String fileName = uploadFile.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
        String storedFileName = uuid + "_" + fileName;

        System.out.println("@#@#@#@#@#@ 여기222");
        System.out.println("fileName"+fileName);
        System.out.println("storedFileName"+storedFileName);

        param.put("refund_img", storedFileName);

        try{
            File saveFile = new File(filePath + storedFileName);
            System.out.println(saveFile.getName());
            uploadFile.transferTo(saveFile);
            System.out.println("이미지 파일 저장 완료");

        }catch (Exception e){

            e.printStackTrace();
        }

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        param.put("refund_number",String.valueOf(dao.getMaxRefundNumber()+1));

        dao.refund(param);

        System.out.println("========BookServiceImpl.refund() end");
    }
}

