package com.bakery.application.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author liting
 * @date 2019-05-09  09:32
 */
public class StockDTO {

    private Integer id;

    private String stockId;

    private String pdtId;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date inTime;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date outTime;

    private String inNum;

    private String outNum;

    private String flag;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date createTime;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date updateTime;

    private String remark;

    private String pdtName;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date endTime;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date beginTime;

    private String inNumDes;

    private String outNumDes;

    public String getInNumDes() {
        return inNumDes;
    }

    public void setInNumDes(String inNumDes) {
        this.inNumDes = inNumDes;
    }

    public String getOutNumDes() {
        return outNumDes;
    }

    public void setOutNumDes(String outNumDes) {
        this.outNumDes = outNumDes;
    }

    public String getOutNum() {
        return outNum;
    }

    public void setOutNum(String outNum) {
        this.outNum = outNum;
    }

    public String getPdtName() {
        return pdtName;
    }

    public void setPdtName(String pdtName) {
        this.pdtName = pdtName;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId == null ? null : stockId.trim();
    }

    public String getPdtId() {
        return pdtId;
    }

    public void setPdtId(String pdtId) {
        this.pdtId = pdtId == null ? null : pdtId.trim();
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
        return outNum;
    }

    public void setOutUnm(String outNum) {
        this.outNum = outNum == null ? null : outNum.trim();
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
