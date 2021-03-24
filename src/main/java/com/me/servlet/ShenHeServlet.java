package com.me.servlet;

import com.me.dao.ShenHeDao;
import com.me.domain.XvQiu;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @Auther: wzs
 * @Date: 2020/10/21 18:22
 * @Description:
 */
@WebServlet("/templete/sh")
public class ShenHeServlet extends HttpServlet {
    private ShenHeDao dao = new ShenHeDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        System.out.println(method);
        if(method.equals("shenhe")){
            shenhe(request,response);
        }
    }

    private void shenhe(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map = request.getParameterMap();
        XvQiu xvQiu = new XvQiu();
        try {
            BeanUtils.populate(xvQiu, map);
            boolean f = dao.shenhe(xvQiu);
            request.getRequestDispatcher("xssh.jsp").forward(request,response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
