package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.StockDTO;
import com.bakery.application.entity.Stock;
import com.bakery.application.entity.StockCriteria;

import java.util.List;

/**
 * @author liting
 * @date 2019-05-09  09:56
 */
public interface StockService {
    public  List<StockDTO> queryStockByPage(Page pag, StockDTO stockDTO);

    public boolean updateByExampleSelective(Stock stock, StockCriteria example);
}
