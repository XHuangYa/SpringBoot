package com.bakery.application.controller;

import com.bakery.application.constant.BootstrapTablePage;
import com.bakery.application.constant.Page;
import com.bakery.application.constant.Url;
import com.bakery.application.constant.Views;
import com.bakery.application.dto.StockDTO;
import com.bakery.application.entity.Stock;
import com.bakery.application.entity.StockCriteria;
import com.bakery.application.service.StockService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019-05-08  16:49
 */
@Controller
public class StockController {
    @Autowired
    StockService stockService;

    /**
     * @Description:入库记录初始化
     * @Author: LiTing
     * @Date: 10:14 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(Url.STORE_IN_LIST)
    public String orderIndex(final Map<String, Object> map) {
        return Views.STORE_IN_VIEW;
    }
    /**
     * @Description:分頁查询
     * @Author: LiTing
     * @Date: 10:14 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.QUERY_STOCK_IN_OR_OUT_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryUserPage(Page page, StockDTO stockDTO) throws ParseException {
        List<StockDTO> stockDTOS = stockService.queryStockByPage(page, stockDTO);
        PageInfo pageInfo = new PageInfo<StockDTO>(stockDTOS);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;
    }
    /**
     * @Description:修改入库量
     * @Author: LiTing
     * @Date: 10:14 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.UPDATE_STOCK_INNUM_URL, method = RequestMethod.POST)
    public @ResponseBody
    boolean updateStockInNum(StockDTO stockDTO) throws ParseException {
        Stock stock=new Stock();
        stock.setInNum(stockDTO.getInNumDes());
        StockCriteria criteria=new StockCriteria();
        StockCriteria.Criteria cri=criteria.createCriteria();
        cri.andStockIdEqualTo(stockDTO.getStockId());
        return stockService.updateByExampleSelective(stock,criteria);
    }
    /**
     * @Description:删除入库单
     * @Author: LiTing
     * @Date: 10:14 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.DELETE_IN_STOCK_URL, method = RequestMethod.POST)
    public @ResponseBody
    boolean updateStockInNum(Stock stock) throws ParseException {
        StockCriteria criteria=new StockCriteria();
        StockCriteria.Criteria cri=criteria.createCriteria();
        cri.andStockIdEqualTo(stock.getStockId());
        stock.setStatus(0);
        return stockService.updateByExampleSelective(stock,criteria);
    }
}
