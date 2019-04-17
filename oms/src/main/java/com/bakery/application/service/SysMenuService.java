package com.bakery.application.service;

import com.bakery.application.entity.SysMenu;
import com.bakery.application.entity.SysMenuCriteria;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/17  22:21
 */
public interface SysMenuService {
    //查询按钮
    List<SysMenu> selecyByCriteria(SysMenuCriteria criteria);
}
