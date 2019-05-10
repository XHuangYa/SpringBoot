package com.bakery.application.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ProductDTO {
    private String pdtId;

    private Integer id;

    private String pdtName;

    private String pdtType;

    private String unitPrice;

    private String measer;

    private Integer status;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date updateTime;

    private String picture;

    private String remark;

    private String measerDes;

    private String statusDes;

    private String pdtTypeDes;


    public String getStatusDes() {
        return statusDes;
    }

    public void setStatusDes(String statusDes) {
        this.statusDes = statusDes;
    }

    public String getMeaserDes() {
        return measerDes;
    }

    public void setMeaserDes(String measerDes) {
        this.measerDes = measerDes;
    }

    public String getPdtTypeDes() {
        return pdtTypeDes;
    }

    public void setPdtTypeDes(String pdtTypeDes) {
        this.pdtTypeDes = pdtTypeDes;
    }



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

    public String getPdtType() {
        return pdtType;
    }

    public void setPdtType(String pdtType) {
        this.pdtType = pdtType == null ? null : pdtType.trim();
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