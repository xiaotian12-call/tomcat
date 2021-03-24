package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.AdminDao;
import com.me.domain.Power;
import com.me.domain.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: wzs
 * @Date: 2020/10/19 20:16
 * @Description:
 */
@WebServlet("/templete/admin")
public class AdminServlet extends HttpServlet {
    private AdminDao dao = new AdminDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        System.out.println(method);
        if(method.equals("chaAllUser")){
            chaAllUser(request,response);
        }else if(method.equals("stop")){
            stop(request,response);
        }else if(method.equals("start")){
            start(request,response);
        }else if(method.equals("delete")){
            delete(request,response);
        }else if(method.equals("query")){
            query(request,response);
        }else if(method.equals("beforeChange")){
            beforeChange(request,response);
        }else if(method.equals("change")){
            change(request,response);
        }else if(method.equals("changePower")){
            changePower(request,response);
        }else if(method.equals("changeJs")){
            changeJs(request,response);
        }else if(method.equals("addJs")){
            addJs(request,response);
        }else if(method.equals("getPower")){
            getPower(request,response);
        }
    }

    private void getPower(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String power1 = request.getParameter("power");
        Power power = dao.power(power1);
        Gson gson = new Gson();
        String json = gson.toJson(power);
        response.getWriter().write(json);
    }

    //添加角色
    private void addJs(HttpServletRequest request, HttpServletResponse response) {
        String powername = request.getParameter("powername");
        String power1 = request.getParameter("power");
        String[] qxes = request.getParameterValues("qx");
        Map<String, String> map = new HashMap<>();
        for (String qx : qxes) {
            map.put(qx,"1");
        }

        Power power = new Power();
        try {
            BeanUtils.populate(power, map);
            power.setPowername(powername);
            power.setPower(Integer.valueOf(power1));
            boolean b = dao.addJs(power);
            if(b){
                response.getWriter().write("<h1>创建成功</h1>");
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    //改变角色的权限
    private void changeJs(HttpServletRequest request, HttpServletResponse response) {
        String js = request.getParameter("js");
        String[] qxes = request.getParameterValues("qx");
        Map<String, String> map = new HashMap<>();
        for (String qx : qxes) {
            map.put(qx,"0");
        }
        Power power = new Power();
        System.out.println(power.toString());
        try {
            BeanUtils.populate(power, map);
            power.setPower(Integer.valueOf(js));
            boolean b = dao.changePower(js, power);
            if(b){
                response.getWriter().write("<h1>修改成功</h1>");
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //改变用户的角色
    private void changePower(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        //Power beforePower = dao.power(Integer.valueOf(id));
        String power = request.getParameter("power");
        boolean f=dao.changePower(id,power);

        response.getWriter().write("{\"f\":"+f+"}");
    }

    //修改用户信息
    private void change(HttpServletRequest request, HttpServletResponse response) {

    }

    //修改用户之前查出用户信息
    private void beforeChange(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        User user = dao.query(id);
    }

    //安照 id 查询用户
    private void query(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        User user = dao.query(id);

    }

    //删除用户
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        boolean f = dao.delete(id);
        response.getWriter().write("{\"f\":"+f+"}");
    }

    //恢复用户
    private void start(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        boolean f = dao.start(id);
        response.getWriter().write("{\"f\":"+f+"}");
    }

    //暂停用户
    private void stop(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        boolean f = dao.stop(id);
        response.getWriter().write("{\"f\":"+f+"}");
    }

    //查询所有用户
    private void chaAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = dao.chaAllUser();
        List<User> list = new ArrayList<>();
        for (User user : users) {
            Power power = dao.power(user.getPower());
            user.setPower(power.getPower());
            list.add(user);
        }
        request.setAttribute("list",list);
        if (users!=null){
            request.getRequestDispatcher("/templete/yhgl.jsp").forward(request,response);
        }else{
            response.getWriter().write("<h1>正在查询.....</h1>");
        }

    }
}
