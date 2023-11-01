package com.jit.common.controller;

import com.jit.common.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/active")
public class ActiveServlet extends HttpServlet {
    private UserServer userServer = new UserServer();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String activeCode = req.getParameter("activeCode");
        userServer.active(activeCode);
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}