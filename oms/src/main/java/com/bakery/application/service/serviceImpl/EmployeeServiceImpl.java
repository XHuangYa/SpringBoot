package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.EmployeeDTO;
import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;
import com.bakery.application.mapper.EmployeeMapper;
import com.bakery.application.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/14  19:11
 */
@Service
@Transactional(readOnly = false)
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    @Override
    public List<Employee> selectByCriteriaPage(EmployeeDTO employeeDTO, Page page) {
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        return employeeMapper.queryByExample(employeeDTO);
    }

    @Override
    public boolean updateByPrimaryKeySelective(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee)>=1?true:false;
    }

    @Override
    public List<Employee> selectByCriteria(EmployeeCriteria employeeCriteria) {
        return employeeMapper.selectByExample(employeeCriteria);
    }

    @Override
    public boolean insertSelective(Employee employee) {
        return employeeMapper.insertSelective(employee)>=1?true:false;
    }


}
