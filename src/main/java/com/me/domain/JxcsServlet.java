package com.me.domain;

import com.google.gson.Gson;
import com.me.dao.Jxcs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2020/11/29 09:39
 * @Description:
 */
@WebServlet("/templete/jxcs")
public class JxcsServlet extends HttpServlet {
    Jxcs dao = new Jxcs();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        if(method.equals("xseAll")){
            xseAll(request,response);
        } else if(method.equals("tj")){
            tj(request,response);
        }
    }

    private void tj(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String tblx = request.getParameter("tblx");
        String tjzd = request.getParameter("tjzd");
        List<Xse> read = new ArrayList<Xse>();
        if(tjzd.equals("xse")){
            read = dao.getXse(num);
        }else if(tjzd.equals("xsl")){
            read = dao.getXsl(num);
        }else if(tjzd.equals("pagerank")){
            read = dao.getPagerank(num);
        }else if(tjzd.equals("yll")){
            read = dao.getYll(num);
        }
        System.out.println(read.get(0).getDlr());
        Gson gson = new Gson();
        String json = gson.toJson(read);
        request.setAttribute("data",read);
        request.setAttribute("json",json);
        request.setAttribute("num",num);
        request.setAttribute("tblx",tblx);
        request.setAttribute("tjzd",tjzd);
        request.getRequestDispatcher("/templete/xse.jsp").forward(request,response);
    }

    //select dlr,hkgs from one where dlr in (select dlr from (select dlr from two order by hyd desc limit 50) as t)
    private void xseAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Xse> read = new ArrayList<Xse>();
        List<Line> line = new ArrayList<Line>();
        read = dao.getPagerank("10");
        line = dao.getLine();
        Gson gson = new Gson();
        String line1 = gson.toJson(line);
        String json = gson.toJson(read);
        request.setAttribute("line",line1);
        request.setAttribute("data",read);
        request.setAttribute("json",json);
        request.getRequestDispatcher("/templete/diantu.jsp").forward(request,response);
    }
}
