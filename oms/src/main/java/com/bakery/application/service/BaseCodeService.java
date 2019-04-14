package com.bakery.application.service;

import com.bakery.application.entity.BaseCode;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/13  21:11
 */
public interface BaseCodeService {
    /**
     * @Description: 根据code_type查data_code
     * @Author: LiTing
     * @Date: 9:12 PM 2019/4/13
     * @return:
     * @throws:
     */
    public List<BaseCode> findByCodeType(String codeType);
}
