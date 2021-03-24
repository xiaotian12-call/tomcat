package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.ChaXunDao;
import com.me.domain.Ktcs;
import com.me.domain.Tjtb;
import com.me.domain.XvQiu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2020/10/21 19:54
 * @Description:
 */
@WebServlet("/templete/cx")
public class ChaXunServlet extends HttpServlet {
    private ChaXunDao dao = new ChaXunDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        System.out.println(method);
        if(method.equals("flcx")){
            flcx(request,response);
        }else if(method.equals("zhjs")){
            zhjs(request,response);
        }else if(method.equals("tjtb")){
            tjtb(request,response);
        }else if(method.equals("ktcs")){
            ktcs(request,response);
        }
    }

    private void ktcs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String n = request.getParameter("n");
        String tjzd = request.getParameter("tjzd");
        String tblx = request.getParameter("tblx");
        System.out.println(tblx);
        List<Ktcs> list = dao.ktcs(tjzd,n);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        request.setAttribute("data",json);
        request.setAttribute("tjzd",tjzd);
        request.setAttribute("tblx",tblx);
        request.getRequestDispatcher("ksh.jsp").forward(request, response);
    }

    private void zhjs(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.removeAttribute("xvQiuList");
        String sql = request.getParameter("sql");
        String qxsj = request.getParameter("qxsj");
        String jzsj = request.getParameter("jzsj");
        String xqzttj = request.getParameter("xqzttj");

        System.out.println("servlet接收到jsp界面的参数：sql"+sql+" qxsj"+qxsj);

        List<XvQiu> list =  dao.zhjs(xqzttj,sql,qxsj,jzsj);
        request.setAttribute("xvQiuList", list);
        System.out.println("dao查询数据成功\nlist"+list.toString());
        request.setAttribute("kid","here");


        //System.out.println(xvQiuList.get(0).getModel()+"123");
        if(list==null) {
            response.getWriter().write("加载失败！");
        }else {
            request.getRequestDispatcher("tongji.jsp").forward(request, response);
        }
    }

    private void tjtb(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.removeAttribute("xvQiuList");
        String sql = request.getParameter("sql2");
        String qxsj = request.getParameter("qxsj");
        String jzsj = request.getParameter("jzsj");
        String tblx = request.getParameter("tblx");
        String tjzd = request.getParameter("tjzd");
        List<Tjtb> list2 = dao.tj(tjzd);
        List<String> list4 = new ArrayList<String>();
        for (Tjtb tjtb : list2) {
            String tjzdz = tjtb.getTjzdz();
            list4.add(tjzdz);
        }
        LinkedHashSet<String> hashSet = new LinkedHashSet<>(list4);
        ArrayList<String> listWithoutDuplicates = new ArrayList<>(hashSet);
        List<Tjtb> list3 = new ArrayList<Tjtb>();
        for (int i = 0; i < listWithoutDuplicates.size(); i++) {
            Tjtb tjtb = dao.tjtb(tjzd, listWithoutDuplicates.get(i));
            list3.add(tjtb);
        }

        Gson gson = new Gson();
        String json = gson.toJson(list3);
        request.setAttribute("tjzd",tjzd);
        request.setAttribute("data",json);
        System.out.println(json);

        List<XvQiu> list =  dao.zhjs(null,sql,qxsj,jzsj);
        request.setAttribute("xvQiuList", list);
        request.setAttribute("kid","here2");
        request.setAttribute("tblx",tblx);
        //System.out.println(xvQiuList.get(0).getModel()+"123");
        if(list==null) {
            response.getWriter().write("加载失败！");
        }else {
            request.getRequestDispatcher("tongji.jsp").forward(request, response);
        }
    }

    private void flcx(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String xqzttj = request.getParameter("xqzttj");
        String bytj = request.getParameter("bytj");
        String bytjz = request.getParameter("bytjz");
        String sfmh = request.getParameter("sfmh");
        String qxsj = request.getParameter("qxsj");
        String jzsj = request.getParameter("jzsj");
        List<XvQiu> list =  dao.flcx(xqzttj,bytj,bytjz,sfmh,qxsj,jzsj);
        request.setAttribute("xvQiuList", list);
        //System.out.println(xvQiuList.get(0).getModel()+"123");
        if(list==null) {
            response.getWriter().write("加载失败！");
        }else {
            request.getRequestDispatcher("tongji.jsp").forward(request, response);
        }
    }
}
