package com.jit.common.service;

import com.jit.common.dao.ProductDao;
import com.jit.common.domain.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public List<FloorVo> findeFloorsHotProducts(int start, int pagesize) {
        PcodeService dao = new PcodeService();
        ProductDao pdao = new ProductDao();

        List<Pcode> pcodeList = dao.findPcodeListByCodeType("4");
        List<FloorVo> floorVos = new ArrayList<FloorVo>();
        for (Pcode pcode : pcodeList)
        {
            List<Product> products = pdao.findHotProductListByPage(pcode.getParam2(), start, pagesize);
            FloorVo vo = new FloorVo();
            vo.setFloorNo(pcode.getParam7());
            vo.setHotProducts(products);
            floorVos.add(vo);
        }
        return floorVos;
    }


    public List<Category> navigationBar() {
        ProductDao dao = new ProductDao();
        List<Category> categoryList = null;
        try {
            categoryList = dao.findAllCategory();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return categoryList;
    }

    public PageBean<Product> findProductListByCid(String cid,int currentPage,int currentCount){
        ProductDao dao = new ProductDao();
        PageBean<Product> pageBean = new PageBean<Product>();
        //当前页数
        pageBean.setCurrentPage(currentPage);
        //当前页显示条数
        pageBean.setCurrentCount(currentCount);
        //获取总条数
        int totalCount = 0;
        try {
            totalCount = dao.getCount(cid);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        int start = (currentPage-1)*currentCount;
        //当页商品，并且默认是查找第一页的商品列表，根据分页机制，需要算出起始条数和一页中的数量
        List<Product> list = null;
        try {
            list = dao.findProductListByPage(cid,start,currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setList(list);
        return pageBean;

    }


    public Product findProductById(String pid) {
        ProductDao dao = new ProductDao();
        Product product = null;
        try {
            product = dao.findProductById(pid);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return product;
    }



}
