package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.User;
import com.bakery.application.entity.UserCriteria;
import com.bakery.application.mapper.UserMapper;
import com.bakery.application.service.UserService;
import com.bakery.application.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
        PageHelper.startPage(page.getPageNo(), page.getPageSize());
        return userMapper.queryByExample(user);
    }

    @Override
    public int insert(User user) {
        UserCriteria userCriteria = new UserCriteria();
        UserCriteria.Criteria cri = userCriteria.createCriteria();
        cri.andUserPhoneEqualTo(user.getUserPhone().trim());
        List<User> users = userMapper.selectByExample(userCriteria);
        if (users.isEmpty()) {
            user.setUserId(UUIDUtil.create32Key());
            int insert = userMapper.insert(user);
            if (insert >= 1) {
                return 1;//成功
            } else {
                return 0;//失败
            }
        } else {
            return 2;//用户存在
        }

    }

    @Override
    public boolean updateByPrimaryKeySelective(User user) {
        if (user.getUpdateTime() == null) {
            user.setUpdateTime(new Date());
        }
        if("男".equals(user.getSexDes())){
            user.setSex(0);

        }else{
            user.setSex(1);
        }
        return userMapper.updateByPrimaryKeySelective(user) >= 1 ? true : false;
    }
}
