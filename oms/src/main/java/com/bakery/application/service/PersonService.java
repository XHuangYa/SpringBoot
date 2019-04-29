package com.bakery.application.service;

import java.util.List;

/**
 * @author liting
 * @date 2019/03/17  18:24
 */
public interface PersonService {

    List<person> select();

    public int addUsers(person person);
}
