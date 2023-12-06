package com.jit.common.controller;

import com.jit.common.domain.User;
import com.jit.common.service.UserService;
import com.jit.common.utils.CommonUtil;
import com.jit.common.utils.MailUtil;
import org.apache.commons.beanutils.BeanUtils;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String methodName = req.getParameter("method");
        if("register".equals(methodName)) {
            register(req,resp);
        } else if ("checkUsername".equals(methodName)) {
            checkUsername(req,resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String methodName = req.getParameter("method");
        if("active".equals(methodName)) {
            active(req,resp);
        }
    }

    protected void active(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userServer = new UserService();
        String activeCode = req.getParameter("activeCode");
        userServer.active(activeCode);
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }

    protected void checkUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取参数
        String username = req.getParameter("username");
        //service验证是否存在
        UserService service = new UserService();
        boolean isExist = service.checkUsername(username);
        String json = "{\"isExist\":"+isExist+"}";//不要写成"{‘isExist‘:"+isExist+"}"
        resp.getWriter().write(json);

    }

    protected void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Map<String,String[]> map = req.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        user.setUid(CommonUtil.generateUUID());
        user.setCode(CommonUtil.generateUUID());
        UserService userServer = new UserService();
        boolean result = userServer.register(user);
        if(result) {
            int port = req.getServerPort();
            String contextPath = req.getContextPath();
            String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
                    + "<a href='http://localhost:"+ port + contextPath +
                    "/user?method=active&activeCode=" + user.getCode() + "'>"
                    + "请点击连接" + "</a>";
            try {
                MailUtil.sendMail(user.getEmail(),"用户激活",emailMsg);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }

    }
}
