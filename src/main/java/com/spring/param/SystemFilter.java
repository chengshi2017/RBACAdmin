package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/6/15
 * @Time: 16:17
 * @Version: 1.0
 * @Describe:
 */
public class SystemFilter {

    private Integer pageNo;

    private Integer pageSize;

    private String userName;

    private String attendStatus;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAttendStatus() {
        return attendStatus;
    }

    public void setAttendStatus(String attendStatus) {
        this.attendStatus = attendStatus;
    }
}
