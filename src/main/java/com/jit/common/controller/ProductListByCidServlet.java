package com.jit.common.controller;

import com.jit.common.domain.PageBean;
import com.jit.common.domain.Product;
import com.jit.common.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet ("/productPage")
public class ProductListByCidServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        String page = req.getParameter("currentPage");
        int currentPage = 1;
        if(page!=null)
        {
            currentPage = Integer.parseInt(page);
        }
        int currentCount=12;

        ProductService service = new ProductService();
        PageBean<Product> pageBean = service.findProductListByCid(cid,currentPage,currentCount);
        req.setAttribute("pageBean", pageBean);




        //获取cookie中名字为pids的Cookie值,查询商品集合,放入request域中,返回product_list.jsp页面中展现
        Cookie[] cookies = req.getCookies();
        List<Product> historyList = new ArrayList<Product>();
        if(cookies!=null)
        {
            for(Cookie c : cookies)
            {
                if("pids".equals(c.getName()))
                {
                    String pids = c.getValue();//获取字符串1,31,33,34
                    String[] pids_arr = pids.split("&");
                    for(String pid : pids_arr)
                    {
                        //根据id查找商品
                        Product product = service.findProductById(pid);
                        historyList.add(product);
                    }
                }
            }
        }
        req.setAttribute("historyList", historyList);
        req.setAttribute("cid", cid);

        req.getRequestDispatcher("/product_list.jsp").forward(req, resp);






    }
}
