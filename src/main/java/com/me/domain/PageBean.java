package com.me.domain;

import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2020/10/27 18:10
 * @Description:
 */
public class PageBean {
    private int currentPage;
    private int currentCount;
    private int totalCount;
    private int totalPage;
    private List<XvQiu> list;
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getCurrentCount() {
        return currentCount;
    }
    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public List<XvQiu> getList() {
        return list;
    }
    public void setList(List<XvQiu> list) {
        this.list = list;
    }

}
