package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/5/22
 * @Time: 13:36
 * @Version: 1.0
 * @Describe:
 */
public class MenuFilter {

    private Integer pageNo;

    private Integer pageSize;

    private String menuName;

    private Integer status;

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
