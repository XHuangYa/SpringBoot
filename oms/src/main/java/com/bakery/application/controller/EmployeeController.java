package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.EmployeeService;
import com.bakery.application.util.JsonUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @author liting
 * @date 2019/04/13  17:14
 */
@Controller
public class EmployeeController {

    @Autowired
    BaseCodeService baseCodeService;

    @Autowired
    EmployeeService employeeService;
    /**
     * @Description: 员工管理主页面
     * @Author: LiTing
     * @Date: 6:52 PM 2019/4/13
     * @return:
     * @throws:
     */
    @RequestMapping(Url.EMP_MANAGER_LIST)
    public String index(Map<String,Object> map){
        //归属部门
        List<BaseCode> deptTypeList=baseCodeService.findByCodeType(CodeTypeConstant.DEPT_TYPE);
        //员工标识
        List<BaseCode> roleTypeList=baseCodeService.findByCodeType(CodeTypeConstant.EMP_ROLE_TYPE);
        //员工职位
        List<BaseCode> JobList=baseCodeService.findByCodeType(CodeTypeConstant.EMP_JOB);
        //上级领导
        List<BaseCode> MgrList=baseCodeService.findByCodeType(CodeTypeConstant.EMP_MGR);
        map.put("deptTypeList", JsonUtil.listtojson(deptTypeList));
        map.put("roleTypeList",JsonUtil.listtojson(roleTypeList));
        map.put("JobList",JsonUtil.listtojson(JobList));
        map.put("MgrList",JsonUtil.listtojson(MgrList));
        Employee employee=new Employee();
        employee.setBirth(new Date());
        map.put("emp",JsonUtil.beantojson(employee));
        return Views.EMP_LIST_VIEW;
    }
    /**
     * @Description: 分页查询员工信息
     * @Author: LiTing
     * @Date: 11:29 PM 2019/4/13
     * @return:
     * @throws:
     */
    @RequestMapping(Url.EMP_MANAGE_QUERY_URL)
    public @ResponseBody BootstrapTablePage queryEmpPage(Page page, Employee employee){
        EmployeeCriteria criteria=new EmployeeCriteria();
        EmployeeCriteria.Criteria cri=criteria.createCriteria();
        cri.andStatusEqualTo(1);
        //员工名称
        if(StringUtils.isNotBlank(employee.getEmpName())){
            cri.andEmpNameLike("%"+employee.getEmpName()+"%");
        }
        //电话号码
        if(StringUtils.isNotBlank(employee.getPhone())){
            cri.andPhoneEqualTo(employee.getPhone());
        }
        //员工标识
        if(StringUtils.isNotBlank(employee.getRoleId())){
            cri.andPhoneEqualTo(employee.getRoleId());
        }
        //归属部门
        if(StringUtils.isNotBlank(employee.getDepno())){
            cri.andPhoneEqualTo(employee.getDepno());
        }
        //开始时间
        if(page.getBeginTime()!=null){
            cri.andDoneTimeGreaterThanOrEqualTo(page.getBeginTime());
        }
        //结束时间
        if(page.getEndTime()!=null){
            cri.andDoneTimeLessThanOrEqualTo(page.getEndTime());
        }
        PageInfo<Employee> pageInfo=null;
        List<Employee> employeeList=null;
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        employeeList = employeeService.selectByCriteria(criteria);
        if(employeeList.size()==0){
            PageHelper.startPage(page.getPageNo()-1,page.getPageSize());
            employeeList = employeeService.selectByCriteria(criteria);
        }
        pageInfo=new PageInfo<Employee>(employeeList);
        BootstrapTablePage bootTable=new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page,pageInfo.getList());
        bootTable.setPageSize(page.getPageSize()+"");
        return bootTable;
    }

}
