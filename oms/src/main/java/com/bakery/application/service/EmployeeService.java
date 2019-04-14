package com.bakery.application.service;

import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/14  19:08
 */
public interface EmployeeService {
    /**
     * @Description:
     * @Author: LiTing
     * @Date: 7:08 PM 2019/4/14
     * @return:
     * @throws:
     */
    public List<Employee> selectByCriteria(EmployeeCriteria employeeCriteria);
}
