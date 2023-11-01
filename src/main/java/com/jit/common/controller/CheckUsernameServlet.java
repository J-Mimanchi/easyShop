package com.jit.common.controller;

import com.jit.common.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckUsernameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取参数
        String username = req.getParameter("username");
        //service验证是否存在
        UserServer service = new UserServer();
        boolean isExist = service.checkUsername(username);
        String json = "{\"isExist\":"+isExist+"}";//不要写成"{‘isExist‘:"+isExist+"}"
        resp.getWriter().write(json);

    }
}
