package com.jit.common.dao;

import com.jit.common.domain.Category;
import com.jit.common.domain.Product;
import com.jit.common.utils.DataSourceUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

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
    public List<Category> findAllCategory() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
        String sql = " select * from category order by cast(cid as signed)";
        return runner.query(sql, new BeanListHandler<Category>(Category.class));
    }
    /**
     *
     * @Title: getCount
     * @Description: 获取所选类别下所有商品的个数
     * @param cid:类别ID
     * @return
     * @throws SQLException
     */
    public int getCount(String cid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
        String sql = " select count(*) from product where cid=?";
        Long row = (Long)runner.query(sql, new ScalarHandler(), cid);
        return row.intValue();
    }
    /**
     *
     * @Title: findProductListByPage
     * @Description: 根据类别ID,查找的页码检索相应的商品列表
     * @param cid
     * @param start
     * @param count
     * @return
     * @throws SQLException
     */
    public List<Product> findProductListByPage(String cid,int start,int count) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
        String sql = " select * from product where cid = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class),cid,start,count);

    }



    public Product findProductById(String pid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
        String sql = " select * from product where pid = ? ";
        return runner.query(sql, new BeanHandler<Product>(Product.class), pid);
    }



}
