package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.dto.EmployeeDTO;
import com.bakery.application.entity.*;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.EmployeeService;
import com.bakery.application.service.SysMenuService;
import com.bakery.application.util.JsonUtil;
import com.bakery.application.util.UUIDUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;


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

    @Autowired
    SysMenuService sysMenuService;

    /**
     * @Description: 员工管理主页面
     * @Author: LiTing
     * @Date: 6:52 PM 2019/4/13
     * @return:
     * @throws:
     */
    @RequestMapping(Url.EMP_MANAGER_LIST)
    public String index(final Map<String, Object> map) {
        //查询按钮
        List<SysMenu> sysMenuList = sysMenuService.selecyByCriteria(new SysMenuCriteria());
        //归属部门
        List<BaseCode> deptTypeList = baseCodeService.findByCodeType(CodeTypeConstant.DEPT_TYPE);
        //员工标识
        List<BaseCode> roleTypeList = baseCodeService.findByCodeType(CodeTypeConstant.EMP_ROLE_TYPE);
        //员工职位
        List<BaseCode> JobList = baseCodeService.findByCodeType(CodeTypeConstant.EMP_JOB);
        //员工性别
        List<BaseCode> sexList = baseCodeService.findByCodeType(CodeTypeConstant.SEX);
        //上级领导
        EmployeeCriteria criteria = new EmployeeCriteria();
        EmployeeCriteria.Criteria cri = criteria.createCriteria();
        cri.andJobEqualTo("1");
        List<Employee> mgrList = employeeService.selectByCriteria(criteria);
        map.put("deptTypeList", JsonUtil.listtojson(deptTypeList));
        map.put("roleTypeList", JsonUtil.listtojson(roleTypeList));
        map.put("JobList", JsonUtil.listtojson(JobList));
        map.put("sysMenuList", JsonUtil.listtojson(sysMenuList));
        map.put("sexList", JsonUtil.listtojson(sexList));
        map.put("mgrList", JsonUtil.listtojson(mgrList));
        return Views.EMP_LIST_VIEW;
    }

    /**
     * @Description: 分页查询员工信息
     * @Author: LiTing
     * @Date: 11:29 PM 2019/4/13
     * @return:bootTable
     * @throws:
     */
    @RequestMapping(value = Url.EMP_MANAGE_QUERY_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryEmpPage(Page page, EmployeeDTO employeeDTO) throws ParseException {
        List<Employee> employeeList = employeeService.selectByCriteriaPage(employeeDTO, page);
        PageInfo pageInfo = new PageInfo<Employee>(employeeList);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;
    }

    /**
     * @Description:删除员工信息
     * @Author: LiTing
     * @Date: 10:44 PM 2019/4/20
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.DELETE_EMP_SINGLE_URL, method = RequestMethod.POST)
    public @ResponseBody
    Boolean deleteEmployee(Employee employee) {
        boolean flag = employeeService.updateByPrimaryKeySelective(employee);
        return flag;
    }

    /**
     * @Description:新增员工/修改员工信息
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_OR_UPDATE_EMPINFO_URL, method = RequestMethod.POST)
    public @ResponseBody
    boolean insertEmp(Employee employee) {
        employee.setEmpNo(UUIDUtil.create32Key());
        employee.setStatus(1);
        boolean flag = employeeService.insertSelective(employee);
        return flag;
    }

}
