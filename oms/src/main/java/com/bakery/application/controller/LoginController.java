package com.bakery.application.controller;

import com.bakery.application.constant.Url;
import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;
import com.bakery.application.service.EmployeeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author liting
 * @date 2019-05-14  14:52
 */
@Controller
public class LoginController {
    @Autowired
    EmployeeService employeeService;
    //用户名密码验证
    @RequestMapping(value = Url.LOGIN_VALID_URL,method = RequestMethod.POST)
    public @ResponseBody boolean loginValid(Employee employee){
        boolean flag=false;
        EmployeeCriteria criteria=new EmployeeCriteria();
        EmployeeCriteria.Criteria cri =criteria.createCriteria();
        if(StringUtils.isNotBlank(employee.getEmpName())&&StringUtils.isNotBlank(employee.getPassword())){
            cri.andEmpNameEqualTo(employee.getEmpName().trim());
            cri.andPasswordEqualTo(employee.getPassword().trim());
            cri.andStatusEqualTo(1);
             flag = employeeService.selectByCriteria(criteria).size() > 0 ? true : false;
        }
        if(StringUtils.isNotBlank(employee.getPhone())){
            cri.andPhoneEqualTo(employee.getPhone());
            cri.andStatusEqualTo(1);
            flag = employeeService.selectByCriteria(criteria).size() > 0 ? true : false;
        }
        return flag;
    }
}
