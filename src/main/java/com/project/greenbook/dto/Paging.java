package com.project.greenbook.dto;

import java.util.List;

public class Paging {
    //총 행의 수
    private int total;
    //현재 페이지 번호
    private int currentPage;
    //총 페이지 수
    private int totalPages;
    //현재 시작 페이지
    private int startPage;
    //마지막 페이지
    private int endPage;
    //페이징 개수
    private int pagingCount;
    //페이징 처리할 데이터

    public Paging(int total, int currentPage, int pagingCount, int size) {
        this.total = total;
        this.currentPage = currentPage;
        this.pagingCount = pagingCount;
        System.out.println(total);

        if(total == 0){ //select 결과가 0
            totalPages = 0;
            startPage = 0;
            endPage = 0;
        }else{ //select 결과가 존재
            //size는 한 페이지당 존재하는 행
            totalPages = (int)Math.ceil((double) total / size);

            startPage = (currentPage / pagingCount) * pagingCount + 1;
            //현재 페이지가 5이고, 페이징 처리 크기가 5일때 시작페이지는 페이징 처리 크기만큼 줄인다.
            if(currentPage % pagingCount == 0){
                startPage -= pagingCount;
            }
            //단순하게 마지막 페이지 처리
            endPage = startPage + pagingCount -1;
            if(endPage > totalPages){
                endPage = totalPages;
            }
        }
        System.out.println("start = "+startPage);
        System.out.println("end = " +endPage);
    }

    public int getTotal() { return total;}

    public int getCurrentPage() {
        return currentPage;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public int getPagingCount() {
        return pagingCount;
    }
}
