package com.jit.common.controller;

import com.alibaba.fastjson.JSON;
import com.jit.common.domain.FloorVo;
import com.jit.common.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/hotproduct")
public class ProductServlet extends HttpServlet {
    private ProductService service = new ProductService();
    private int pagesize = 12;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        List<FloorVo> hotProducts = service.findeFloorsHotProducts(0, pagesize);
        String jsonString = JSON.toJSONString(hotProducts);
        resp.getWriter().write(jsonString);

    }
}
