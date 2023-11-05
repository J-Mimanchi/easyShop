package com.jit.common.dao;

import com.jit.common.entitys.Product;
import com.jit.common.utils.DataSourceUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProductDao {
    public List<Product> findHotProductListByPage(String cid, int start, int pagesize) {
        List<Product> cList = null;
        QueryRunner runner =  new QueryRunner(DataSourceUtil.getDataSource());
        String sql = " select * from product a where a.is_hot = 1 and a.cid = ? order by pdate desc limit ?,?";
        try {
            cList = runner.query(sql, new BeanListHandler<Product>(Product.class), cid, start, pagesize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cList;
    }
}
