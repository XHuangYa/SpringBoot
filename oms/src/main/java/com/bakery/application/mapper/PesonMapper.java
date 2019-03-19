package com.bakery.application.mapper;

import com.bakery.application.entity.person;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author liting
 * @date 2019/03/17  18:20
 */
@Mapper
public interface PesonMapper {

    @Select("select * from user")
    List<person> select();

    @Insert("insert into user values(#{name},#{age},#{sex},#{addr},#{id})")
    public  int addUsers(person person);

}
