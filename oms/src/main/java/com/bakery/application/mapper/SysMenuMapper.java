package com.bakery.application.mapper;

import com.bakery.application.entity.SysMenu;
import com.bakery.application.entity.SysMenuCriteria;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface SysMenuMapper {
    int countByExample(SysMenuCriteria example);

    int deleteByExample(SysMenuCriteria example);

    int deleteByPrimaryKey(Integer id);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    List<SysMenu> selectByExample(SysMenuCriteria example);

    SysMenu selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SysMenu record, @Param("example") SysMenuCriteria example);

    int updateByExample(@Param("record") SysMenu record, @Param("example") SysMenuCriteria example);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);
}