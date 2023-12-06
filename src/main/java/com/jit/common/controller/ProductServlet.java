package com.jit.common.controller;

import com.alibaba.fastjson.JSON;
import com.jit.common.domain.*;
import com.jit.common.service.PcodeService;
import com.jit.common.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String methodName = req.getParameter("method");

        if("productInfo".equals(methodName)){
            productInfo(req,resp);
        } else if ("productPage".equals(methodName)) {
            productPage(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String methodName = req.getParameter("method");

        if("navegationBar".equals(methodName)){
            navegationBar(req,resp);
        } else if ("indexFloor".equals(methodName)) {
            indexFloor(req,resp);
        } else if ("hotproduct".equals(methodName)) {
            hotproduct(req,resp);
        }

    }

    protected void hotproduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = new ProductService();
        int pagesize = 12;
        resp.setContentType("text/html; charset=UTF-8");
        List<FloorVo> hotProducts = service.findeFloorsHotProducts(0, pagesize);
        String jsonString = JSON.toJSONString(hotProducts);
        resp.getWriter().write(jsonString);
    }

    protected void navegationBar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = new ProductService();
        List<Category> cateGorylist = service.navigationBar();
        resp.setContentType("text/html; charset=UTF-8");
        String buf = JSON.toJSONString(cateGorylist);
        resp.getWriter().write(buf);
    }

    protected void indexFloor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PcodeService service = new PcodeService();
        resp.setContentType("text/html; charset=UTF-8");
        List<Pcode> pcodelist = service.findPcodeListByCodeType("4");
        String jsonString = JSON.toJSONString(pcodelist);
        resp.getWriter().write(jsonString);
    }

    protected void productInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取cid和currentPage,传递到商品详细页面
        String cid = req.getParameter("cid");
        String currentPage = req.getParameter("currentPage");
        //传入request域中
        req.setAttribute("cid", cid);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("product", req.getAttribute("product"));

        //获取商品id
        String pid = req.getParameter("pid");
        //根据商品id查找该商品对象
        ProductService service = new ProductService();
        Product product = service.findProductById(pid);
        req.setAttribute("product", product);


        //1.从cookie中读取是否有名字是pids的值
        String pids = pid;

        //获取所有Cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                //判断是否是Pids这个cookie
                if ("pids".equals(cookie.getName())) {
                    //有名为pids这个cookie,则获取其存储的值,
					/*每次在原值的前面拼接这一次访问的pid
					原则是:1)将最新访问的放在最前面.
						例如:如果获取的cookie值为 1,2,3 则商品访问顺序为先访问的3-->2-->1,
						即最新一次访问商品ID是1
						2)如果有重复商品,则先将字符串中重复的ID删除,再将该重复的放在最前面
						例如:如果获取的cookie值为 1,2,3
						该次访问的pid=2,则拼接完成后应该是2,1,3
					 */
                    pids = cookie.getValue();//1,2,3


                    //获取到cookie值后,处理,将字符串转为数组
                    String[] strs = pids.split("&");//{1,2,3}
                    //将数组转换为LinkedList操作更简便,先将数组转成List集合,再转成LinkedList集合
                    List<String> arrList = Arrays.asList(strs);
                    LinkedList<String> list = new LinkedList<>(arrList);
                    list.remove(pid);
                    //无论重不重复都要添加在起始位置
                    list.addFirst(pid);

                    StringBuffer sb = new StringBuffer();
                    //再将集合转为String
                    for (int i = 0; i < list.size() && i < 7; i++) {
                        sb.append(list.get(i));
                        sb.append("&");
                    }
                    pids = sb.substring(0, sb.length() - 1);
                    break;
                }
            }
        }
        //创建Cookie,将新拼接好的pids携带回客户端
        Cookie c = new Cookie("pids", pids);
        resp.addCookie(c);
        req.getRequestDispatcher("/product_info.jsp").forward(req, resp);
    }

    protected void productPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
