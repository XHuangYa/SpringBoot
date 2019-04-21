package com.bakery.application.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author liting
 * @date 2019/04/16  21:57
 */
public class EmployeeDTO {
    private String empNo;

    private Integer id;

    private String empName;

    private String password;

    private String phone;

    private String roleId;

    private String job;

    private String mgr;

    private Integer sex;
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date birth;

    private String sal;

    private String addr;

    private String depNo;
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date doneTime;

    private Integer status;
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date createTime;
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date updateTime;

    private String remark;

    private String roleDes;//员工权限
    private String sexDes; //性别描述
    private String depDes; //部门描述
    private String mgrDes; //上级领导
    private String jobDes; //工作
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date beginTime; //开始时间
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date endTime;//结束时间

    public String getJobDes() {
        return jobDes;
    }

    public void setJobDes(String jobDes) {
        this.jobDes = jobDes;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getMgrDes() {
        return mgrDes;
    }

    public void setMgrDes(String mgrDes) {
        this.mgrDes = mgrDes;
    }


    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getMgr() {
        return mgr;
    }

    public void setMgr(String mgr) {
        this.mgr = mgr;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getSal() {
        return sal;
    }

    public void setSal(String sal) {
        this.sal = sal;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getDepNo() {
        return depNo;
    }

    public void setDepNo(String depNo) {
        this.depNo = depNo;
    }

    public Date getDoneTime() {
        return doneTime;
    }

    public void setDoneTime(Date doneTime) {
        this.doneTime = doneTime;
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
        this.remark = remark;
    }

    public String getRoleDes() {
        return roleDes;
    }

    public void setRoleDes(String roleDes) {
        this.roleDes = roleDes;
    }

    public String getSexDes() {
        return sexDes;
    }

    public void setSexDes(String sexDes) {
        this.sexDes = sexDes;
    }

    public String getDepDes() {
        return depDes;
    }

    public void setDepDes(String depDes) {
        this.depDes = depDes;
    }

    @Override
    public String toString() {
        return "EmployeeDTO{" +
                "empNo='" + empNo + '\'' +
                ", id=" + id +
                ", empName='" + empName + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", roleId='" + roleId + '\'' +
                ", job='" + job + '\'' +
                ", mgr='" + mgr + '\'' +
                ", sex=" + sex +
                ", birth=" + birth +
                ", sal='" + sal + '\'' +
                ", addr='" + addr + '\'' +
                ", depNo='" + depNo + '\'' +
                ", doneTime=" + doneTime +
                ", status=" + status +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", remark='" + remark + '\'' +
                ", roleDes='" + roleDes + '\'' +
                ", sexDes='" + sexDes + '\'' +
                ", depDes='" + depDes + '\'' +
                ", mgrDes='" + mgrDes + '\'' +
                ", jobDes='" + jobDes + '\'' +
                ", beginTime=" + beginTime +
                ", endTime=" + endTime +
                '}';
    }
}
