package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.dto.ProductDTO;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.entity.Product;

import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/01  23:58
 */
public interface ProductService {
	/**
	 * @Description:加载订单获得商品类别树
	 * @Author: LiTing
	 * @Date: 2:46 PM 2019/5/4
	 * @return:
	 * @throws:
	 */
	List<BaseCodeDTO> selectLeftTrees();
	/**
	 * @Description:分页查询
	 * @Author: LiTing
	 * @Date: 2:46 PM 2019/5/4
	 * @return:
	 * @throws:
	 */
	List<ProductDTO> selectByCriteriaPage(Page page, Product product);
	/**
	 * @Description:新增商品
	 * @Author: LiTing
	 * @Date: 2:46 PM 2019/5/4
	 * @return:
	 * @throws:
	 */
	Map<String,Object> insertSelective (Product product);
	/**
	 * @Description:修改商品
	 * @Author: LiTing
	 * @Date: 2:46 PM 2019/5/4
	 * @return:
	 * @throws:
	 */
	Map<String,Object> updateByPrimaryKeySelective(Product product,String flag);
}
