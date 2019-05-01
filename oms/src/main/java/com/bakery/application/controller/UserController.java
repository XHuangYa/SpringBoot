package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.dto.EmployeeDTO;
import com.bakery.application.entity.*;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.EmployeeService;
import com.bakery.application.service.SysMenuService;
import com.bakery.application.service.UserService;
import com.bakery.application.util.JsonUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019-04-30  14:14
 */
@Controller
public class UserController {

    @Autowired
    BaseCodeService baseCodeService;
    @Autowired
    SysMenuService sysMenuService;
    @Autowired
    UserService userService;

    /**
     * @Description: 客戶管理主页面
     * @Author: LiTing
     * @Date: 3:52 PM 2019/4/30
     * @return:
     * @throws:
     */
    @RequestMapping(Url.USER_MANAGER_LIST)
    public String userIndex(final Map<String, Object> map) {
        //查询按钮
        List<SysMenu> sysMenuList = sysMenuService.selecyByCriteria(new SysMenuCriteria());
        //性别
        List<BaseCode> sexList = baseCodeService.findByCodeType(CodeTypeConstant.SEX);
        map.put("sexList", JsonUtil.listtojson(sexList));
        map.put("sysMenuList", JsonUtil.listtojson(sysMenuList));
        return Views.USER_LIST_VIEW;
    }

    /**
     * @Description: 分页查询客户信息
     * @Author: LiTing
     * @Date: 11:29 PM 2019/4/13
     * @return:bootTable
     * @throws:
     */
    @RequestMapping(value = Url.USER_MANAGE_QUERY_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryUserPage(Page page, User user) throws ParseException {
        List<User> userInfoList = userService.selectByCriteriaPage(user, page);
        PageInfo pageInfo = new PageInfo<User>(userInfoList);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;
    }

    /**
     * @Description: 新增和修改功能
     * @Author: LiTing
     * @Date: 1:12 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_OR_UPDATE_USER_URL)
    public @ResponseBody
    Map<String, Object> insertOrUpdateUser(User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StringUtils.isBlank(user.getUserId())) {//新增
            final int insert = userService.insert(user);
            if (insert == 1) {
                map.put("result", true);
            } else if (insert == 0) {
                map.put("result", false);
            } else {
                map.put("repeat", false);
            }
        } else {
            final boolean b = userService.updateByPrimaryKeySelective(user);
            if (b) {
                map.put("result", true);
            } else {
                map.put("result", false);
            }
        }
        return map;
    }
    /**
     * @Description: 删除用户
     * @Author: LiTing
     * @Date: 5:12 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(value =Url.DELETE_USER_SINGLE_URL)
    public @ResponseBody
    boolean deleteUser(User user){
        user.setStatus(0);
        return userService.updateByPrimaryKeySelective(user);
    }

}
