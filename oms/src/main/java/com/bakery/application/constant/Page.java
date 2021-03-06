package com.bakery.application.constant;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liting
 * @date 2019/04/14  16:33
 */
public class Page implements Serializable {

    private static final long serialVersionUID = -1342567220474609297L;
    private int pageNo;
    private int pageSize;
    private String searchText;


    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
