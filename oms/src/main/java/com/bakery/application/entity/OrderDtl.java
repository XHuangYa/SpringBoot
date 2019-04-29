package com.bakery.application.entity;

import java.util.Date;

public class OrderDtl {
    private String orderDtlId;

    private Integer id;

    private String orderId;

    private String pdtId;

    private Integer pdtNum;

    private String dtlTotalPrice;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String remark;

    public String getOrderDtlId() {
        return orderDtlId;
    }

    public void setOrderDtlId(String orderDtlId) {
        this.orderDtlId = orderDtlId == null ? null : orderDtlId.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getPdtId() {
        return pdtId;
    }

    public void setPdtId(String pdtId) {
        this.pdtId = pdtId == null ? null : pdtId.trim();
    }

    public Integer getPdtNum() {
        return pdtNum;
    }

    public void setPdtNum(Integer pdtNum) {
        this.pdtNum = pdtNum;
    }

    public String getDtlTotalPrice() {
        return dtlTotalPrice;
    }

    public void setDtlTotalPrice(String dtlTotalPrice) {
        this.dtlTotalPrice = dtlTotalPrice == null ? null : dtlTotalPrice.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}