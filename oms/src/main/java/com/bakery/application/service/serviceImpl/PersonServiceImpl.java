package com.bakery.application.service.serviceImpl;

import com.bakery.application.entity.person;
import com.bakery.application.mapper.PesonMapper;
import com.bakery.application.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author liting
 * @date 2019/03/17  18:25
 */
@Service
@Transactional(readOnly = false)
public class PersonServiceImpl implements PersonService {
    @Autowired
    PesonMapper personMapper;

    @Override
    public List<person> select() {
        return personMapper.select();
    }

    @Override
    public int addUsers(person person) {
        return personMapper.addUsers(person);
    }
}
