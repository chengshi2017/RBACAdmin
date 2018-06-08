package com.spring.model.attend;

import java.util.Date;

public class Apply {

    private String reAttendId;

    private Date attendDate;

    private String reAttendStarterId;

    private Date reAttendMor;

    private Date reAttendEve;

    private String reAttendHandlerId;

    private Integer status;

    private String comments;

    public Apply(String reAttendId, Date attendDate, String reAttendStarterId, Date reAttendMor, Date reAttendEve, String reAttendHandlerId, Integer status, String comments) {
        this.reAttendId = reAttendId;
        this.attendDate = attendDate;
        this.reAttendStarterId = reAttendStarterId;
        this.reAttendMor = reAttendMor;
        this.reAttendEve = reAttendEve;
        this.reAttendHandlerId = reAttendHandlerId;
        this.status = status;
        this.comments = comments;
    }

    public Apply() {
        super();
    }

    public String getReAttendId() {
        return reAttendId;
    }

    public void setReAttendId(String reAttendId) {
        this.reAttendId = reAttendId == null ? null : reAttendId.trim();
    }

    public Date getAttendDate() {
        return attendDate;
    }

    public void setAttendDate(Date attendDate) {
        this.attendDate = attendDate;
    }

    public String getReAttendStarterId() {
        return reAttendStarterId;
    }

    public void setReAttendStarterId(String reAttendStarterId) {
        this.reAttendStarterId = reAttendStarterId == null ? null : reAttendStarterId.trim();
    }

    public Date getReAttendMor() {
        return reAttendMor;
    }

    public void setReAttendMor(Date reAttendMor) {
        this.reAttendMor = reAttendMor;
    }

    public Date getReAttendEve() {
        return reAttendEve;
    }

    public void setReAttendEve(Date reAttendEve) {
        this.reAttendEve = reAttendEve;
    }

    public String getReAttendHandlerId() {
        return reAttendHandlerId;
    }

    public void setReAttendHandlerId(String reAttendHandlerId) {
        this.reAttendHandlerId = reAttendHandlerId == null ? null : reAttendHandlerId.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }
}