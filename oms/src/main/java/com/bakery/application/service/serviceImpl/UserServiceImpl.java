package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.User;
import com.bakery.application.entity.UserCriteria;
import com.bakery.application.mapper.UserMapper;
import com.bakery.application.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author liting
 * @date 2019-04-30  14:57
 */
@Service
@Transactional(readOnly = false)
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> selectByCriteriaPage(User user, Page page) {
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        return userMapper.queryByExample(user);
    }
}
