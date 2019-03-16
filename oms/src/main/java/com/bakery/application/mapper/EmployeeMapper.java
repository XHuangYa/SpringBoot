package com.bakery.application.mapper;

import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    int countByExample(EmployeeCriteria example);

    int deleteByExample(EmployeeCriteria example);

    int deleteByPrimaryKey(String empNo);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeCriteria example);

    Employee selectByPrimaryKey(String empNo);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeCriteria example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeCriteria example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}