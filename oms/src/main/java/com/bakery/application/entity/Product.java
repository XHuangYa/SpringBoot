package com.bakery.application.entity;

import java.util.Date;

public class Product {
    private String pdtId;

    private Integer id;

    private String pdtName;

    private Integer pdtType;

    private String unitPrice;

    private String measer;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String picture;

    private String remark;

    public String getPdtId() {
        return pdtId;
    }

    public void setPdtId(String pdtId) {
        this.pdtId = pdtId == null ? null : pdtId.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPdtName() {
        return pdtName;
    }

    public void setPdtName(String pdtName) {
        this.pdtName = pdtName == null ? null : pdtName.trim();
    }

    public Integer getPdtType() {
        return pdtType;
    }

    public void setPdtType(Integer pdtType) {
        this.pdtType = pdtType;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice == null ? null : unitPrice.trim();
    }

    public String getMeaser() {
        return measer;
    }

    public void setMeaser(String measer) {
        this.measer = measer == null ? null : measer.trim();
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}