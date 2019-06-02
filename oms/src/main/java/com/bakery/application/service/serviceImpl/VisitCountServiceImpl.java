package com.bakery.application.service.serviceImpl;

/**
 * @author liting
 * @date 2019/05/27  10:52
 */

import com.bakery.application.entity.VisitCount;
import com.bakery.application.entity.VisitCountCriteria;
import com.bakery.application.service.VisitCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional(readOnly = false)
public class VisitCountServiceImpl implements VisitCountService {

	@Override
	public boolean updateByExampleSelective(VisitCount record, VisitCountCriteria example) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<VisitCount> selectByExample(VisitCountCriteria example) {
		// TODO Auto-generated method stub
		return null;
	}
}
