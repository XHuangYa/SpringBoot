package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.User;
import com.bakery.application.entity.UserCriteria;

import java.util.List;

/**
 * @author liting
 * @date 2019-04-30  14:35
 */
public interface UserService {
     /**
     * @Description:分页查询
     * @Author: LiTing
     * @Date: 7:08 PM 2019/4/14
     * @return:
     * @throws:
     */
    List<User> selectByCriteriaPage(User user, Page page);
}
