package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.OrderDtlService;
import com.bakery.application.service.OrderService;
import com.bakery.application.service.ProductService;
import com.bakery.application.util.JsonUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/01  22:14
 */
@Controller
public class ProductController {

    @Autowired
    BaseCodeService baseCodeService;

    @Autowired
    OrderService orderService;
    
    @Autowired
    ProductService productService;


    @RequestMapping(value = Url.SELECT_LEFT_TREE, method = RequestMethod.POST)
	public @ResponseBody String selectLeftTrees() {
	    List<BaseCodeDTO> baselistdto=productService.selectLeftTrees();
		return JsonUtil.listtojson(baselistdto);
	}
}
