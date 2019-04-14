package com.bakery.application.service.serviceImpl;

import com.bakery.application.entity.BaseCode;
import com.bakery.application.mapper.BaseCodeMapper;
import com.bakery.application.service.BaseCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/13  21:13
 */
@Service
@Transactional(readOnly = false)
public class BaseCodeServideImpl implements BaseCodeService {
    @Autowired
    BaseCodeMapper baseCodeMapper;
    @Override
    public List<BaseCode> findByCodeType(String codeType) {
        return baseCodeMapper.selectByCodeType(codeType);
    }
}
