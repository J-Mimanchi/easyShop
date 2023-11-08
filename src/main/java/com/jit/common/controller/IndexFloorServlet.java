package com.jit.common.controller;

import com.alibaba.fastjson.JSON;
import com.jit.common.domain.Pcode;
import com.jit.common.service.PcodeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/indexFloor")
public class IndexFloorServlet extends HttpServlet {
    private PcodeService service = new PcodeService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        List<Pcode> pcodelist = service.findPcodeListByCodeType("4");
        String jsonString = JSON.toJSONString(pcodelist);
        resp.getWriter().write(jsonString);

    }
}
