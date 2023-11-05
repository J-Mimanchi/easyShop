package com.jit.common.server;

import com.jit.common.dao.ProductDao;
import com.jit.common.entitys.FloorVo;
import com.jit.common.entitys.Pcode;
import com.jit.common.entitys.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductServer {
    public List<FloorVo> findeFloorsHotProducts(int start, int pagesize)
    {
        PcodeServer dao = new PcodeServer();
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

}
