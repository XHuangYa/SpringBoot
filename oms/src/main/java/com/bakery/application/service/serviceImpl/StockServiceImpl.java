package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.ProductDTO;
import com.bakery.application.dto.StockDTO;
import com.bakery.application.entity.Product;
import com.bakery.application.entity.Stock;
import com.bakery.application.entity.StockCriteria;
import com.bakery.application.mapper.StockMapper;
import com.bakery.application.service.StockService;
import com.bakery.application.util.CopyUtil;
import com.bakery.application.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author liting
 * @date 2019-05-09  09:57
 */
@Service
@Transactional(readOnly = false)
public class StockServiceImpl implements StockService {
    @Autowired
    StockMapper stockMapper;

    @Override
    public int insertBatch(List<Stock> stocks) {
        return stockMapper.insertBatch(stocks);
    }

    @Override
    public List<ProductDTO> queryStockList(Page page, Product product) {
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        return stockMapper.queryStockList(product);
    }

    @Override
    public List<StockDTO> queryStockByPage(Page page, StockDTO stockDTO) {
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        return stockMapper.queryStockByPage(stockDTO);
    }

    @Override
    public boolean updateByExampleSelective(Stock stock, StockCriteria example) {
        return stockMapper.updateByExampleSelective(stock,example)>=1?true:false;
    }

    @Override
    public boolean insertSelective(Stock stock) {
            stock.setStatus(1);
            stock.setFlag("IN");
            stock.setCreateTime(new Date());
            stock.setUpdateTime(new Date());
            stock.setStockId(UUIDUtil.create32Key());
        return stockMapper.insertSelective(stock)>=1?true:false;
    }
}
