package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.EmployeeDTO;
import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/14  19:08
 */
public interface EmployeeService {
    /**
     * @Description:分页查询
     * @Author: LiTing
     * @Date: 7:08 PM 2019/4/14
     * @return:
     * @throws:
     */
    public List<Employee> selectByCriteriaPage(EmployeeDTO employeeDTO, Page Page);
    /**
     * @Description: 删除emp/修改用户
     * @Author: LiTing
     * @Date: 11:21 PM 2019/4/20
     * @return:
     * @throws:
     */
    public boolean updateByPrimaryKeySelective(Employee employee);
    /**
     * @Description:
     * @Author: LiTing
     * @Date: 11:32 AM 2019/4/21
     * @return:
     * @throws:
     */
    public List<Employee> selectByCriteria(EmployeeCriteria employeeCriteria);
    /**
     * @Description: 新增员工
     * @Author: LiTing
     * @Date: 12:47 PM 2019/4/21
     * @return:
     * @throws:
     */
    public boolean insertSelective(Employee employee);
    /**
     * @Description:找回密码
     * @Author: LiTing
     * @Date: 10:04 PM 2019/5/21
     * @return:
     * @throws:
     */
    public boolean updateByExampleSelective(Employee record,EmployeeCriteria example);


}
