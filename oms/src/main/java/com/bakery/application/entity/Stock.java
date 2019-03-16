package com.bakery.application.entity;

import java.util.Date;

public class Stock {
    private String stockId;

    private Integer id;

    private String storeId;

    private String pdtId;

    private String pdtCode;

    private Date inTime;

    private Date outTime;

    private String inNum;

    private String outUnm;

    private String flag;

    private Date createTime;

    private Date updateTime;

    private String remark;

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId == null ? null : stockId.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId == null ? null : storeId.trim();
    }

    public String getPdtId() {
        return pdtId;
    }

    public void setPdtId(String pdtId) {
        this.pdtId = pdtId == null ? null : pdtId.trim();
    }

    public String getPdtCode() {
        return pdtCode;
    }

    public void setPdtCode(String pdtCode) {
        this.pdtCode = pdtCode == null ? null : pdtCode.trim();
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }

    public String getInNum() {
        return inNum;
    }

    public void setInNum(String inNum) {
        this.inNum = inNum == null ? null : inNum.trim();
    }

    public String getOutUnm() {
        return outUnm;
    }

    public void setOutUnm(String outUnm) {
        this.outUnm = outUnm == null ? null : outUnm.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
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