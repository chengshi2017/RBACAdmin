package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/5/22
 * @Time: 8:53
 * @Version: 1.0
 * @Describe:
 */
public class RoleFilter {

    private String roleName;

    private Integer status;

    private Integer pageNo;

    private Integer pageSize;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

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
}
