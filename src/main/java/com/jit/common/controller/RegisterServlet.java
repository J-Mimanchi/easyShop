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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userServer = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Map <String,String[]> map = req.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        user.setUid(CommonUtil.generateUUID());
        user.setCode(CommonUtil.generateUUID());
        boolean result = userServer.register(user);
        if(result) {
            int port = req.getServerPort();
            String contextPath = req.getContextPath();
            String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
                    + "<a href='http://localhost:"+ port + contextPath +
                    "/active?activeCode=" + user.getCode() + "'>"
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
