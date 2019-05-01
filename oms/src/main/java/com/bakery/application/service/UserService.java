package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.User;

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
    public List<User> selectByCriteriaPage(User user, Page page);

    /**
     * @Description: 新增用户信息
     * @Author: LiTing
     * @Date: 3:11 PM 2019/5/1
     * @return:
     * @throws:
     */
    public int insert(User user);

    /**
     * @Description: 修改/删除用户信息
     * @Author: LiTing
     * @Date: 3:27 PM 2019/5/1
     * @return:
     * @throws:
     */
    public boolean updateByPrimaryKeySelective(User user);
}