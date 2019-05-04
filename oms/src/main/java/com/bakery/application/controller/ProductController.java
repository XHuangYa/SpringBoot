package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.ProductDTO;
import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.Product;
import com.bakery.application.entity.SysMenu;
import com.bakery.application.entity.SysMenuCriteria;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.OrderService;
import com.bakery.application.service.ProductService;
import com.bakery.application.service.SysMenuService;
import com.bakery.application.util.JsonUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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


    @Autowired
    SysMenuService sysMenuService;


    /**
     * @Description:商品管理列表首页
     * @Author: LiTing
     * @Date: 1:19 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(Url.PDT_MANAGER_LIST)
    public String pdtIndex(final Map<String, Object> map) {
        List<BaseCode> pdtTypeList = baseCodeService.findByCodeType(CodeTypeConstant.PDT_TYPE);
        //查询按钮
        List<SysMenu> sysMenuList = sysMenuService.selecyByCriteria(new SysMenuCriteria());
        map.put("sysMenuList", JsonUtil.listtojson(sysMenuList));
        map.put("pdtTypeList", JsonUtil.listtojson(pdtTypeList));
        return Views.PDT_LIST_VIEW;
    }

    /**
     * @Description:分页查询
     * @Author: LiTing
     * @Date: 2:46 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.PDT_MANAGE_QUERY_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryPdtByPage(Product product, Page page) {
        List<ProductDTO> productList = productService.selectByCriteriaPage(page, product);
        PageInfo pageInfo = new PageInfo<ProductDTO>(productList);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;

    }

    /**
     * @Description: 加载订单获得商品类别树
     * @Author: LiTing
     * @Date: 2:49 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.SELECT_LEFT_TREE, method = RequestMethod.POST)
    public @ResponseBody
    String selectLeftTrees() {
        List<BaseCodeDTO> baselistdto = productService.selectLeftTrees();
        return JsonUtil.listtojson(baselistdto);
    }
}
