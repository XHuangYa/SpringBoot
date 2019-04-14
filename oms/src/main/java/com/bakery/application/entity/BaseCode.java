package com.bakery.application.entity;

public class BaseCode {
    private Integer id;

    private String dataCode;

    private String codeType;

    private String codeName;

    private Integer status;

    private Integer sort;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDataCode() {
        return dataCode;
    }

    public void setDataCode(String dataCode) {
        this.dataCode = dataCode == null ? null : dataCode.trim();
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType == null ? null : codeType.trim();
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName == null ? null : codeName.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getRemark() {
        return remark;
    }


    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();

    }
    @Override
    public String toString() {
        return "BaseCode{" +
                "id=" + id +
                ", dataCode='" + dataCode + '\'' +
                ", codeType='" + codeType + '\'' +
                ", codeName='" + codeName + '\'' +
                ", status=" + status +
                ", sort=" + sort +
                ", remark='" + remark + '\'' +
                '}';
    }
}