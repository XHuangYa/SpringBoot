package com.bakery.application.service.serviceImpl;

import com.bakery.application.entity.SysMenu;
import com.bakery.application.entity.SysMenuCriteria;
import com.bakery.application.mapper.SysMenuMapper;
import com.bakery.application.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/17  22:24
 */
@Service
@Transactional(readOnly = false)
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    SysMenuMapper sysMenuMapper;

    @Override
    public List<SysMenu> selecyByCriteria(SysMenuCriteria criteria) {
        return sysMenuMapper.selectByExample(criteria);
    }
}
