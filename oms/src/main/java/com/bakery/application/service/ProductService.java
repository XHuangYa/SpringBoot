package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderDtl;

import java.util.List;

/**
 * @author liting
 * @date 2019/05/01  23:58
 */
public interface ProductService {
	List<BaseCodeDTO> selectLeftTrees();
}
