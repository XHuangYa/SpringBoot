package com.bakery.application.service;

import com.bakery.application.entity.VisitCount;
import com.bakery.application.entity.VisitCountCriteria;

import java.util.List;

/**
 * @author liting
 * @date 2019/05/27  10:51
 */
public interface VisitCountService {

    public boolean updateByExampleSelective(VisitCount record, VisitCountCriteria example);

    public List<VisitCount> selectByExample(VisitCountCriteria example);
}
