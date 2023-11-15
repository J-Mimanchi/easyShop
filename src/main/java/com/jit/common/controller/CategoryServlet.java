package com.jit.common.controller;

import com.alibaba.fastjson.JSON;
import com.jit.common.domain.Category;
import com.jit.common.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet ("/navegationBar")
public class CategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = new ProductService();
        List<Category> cateGorylist = service.navigationBar();
        resp.setContentType("text/html; charset=UTF-8");
        String buf = JSON.toJSONString(cateGorylist);
        resp.getWriter().write(buf);

    }
}
