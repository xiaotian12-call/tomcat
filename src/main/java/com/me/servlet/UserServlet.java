package com.me.servlet;

import com.me.dao.UserDao;
import com.me.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDao dao = new UserDao();   
    public UserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if(method.equals("login")) {
			try {
				login(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("check")) {
			try {
				check(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("changePassword")) {
			try {
				changePassword(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	private void changePassword(HttpServletRequest request, HttpServletResponse response)throws  SQLException, ServletException, IOException{
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String oldpassword = request.getParameter("oldPassword");
		User user = dao.checkP(oldpassword);
		System.out.println(password+"-"+repassword+"-"+oldpassword+"-"+user.getCompany());
		if (user == null || !repassword.equals(password)) {
			response.getWriter().write("修改失败1！");
		} else {
			user = dao.changePassword(repassword, user.getId());
			if(user==null) {
				response.getWriter().write("修改失败2！");
			}else {
				request.getSession().setAttribute("user", user);
				response.getWriter().write("修改成功！");
			}
		}
	}

	private void check(HttpServletRequest request, HttpServletResponse response) throws  SQLException, ServletException, IOException{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String yan = request.getParameter("yan");
		String yans = (String) request.getSession().getAttribute("rand");
		User userU = dao.checkU(userName);
		User userP = dao.checkP(password);
		int a = 0;
		if(userU == null) {
			a=1;
		}else if(userP == null) {
			a=2;
		}else if(!yan.equals(yans)) {
			a=3;
		}else {
			a=4;
		}
		System.out.println("a= "+a);
		response.getWriter().write("{\"a\":"+a+"}");
	}

	private void login(HttpServletRequest request, HttpServletResponse response)  throws  SQLException, ServletException, IOException{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println(userName+" "+password);
		String yan = request.getParameter("yan");
		String yans = (String) request.getSession().getAttribute("rand");
		Boolean f1 = yan.equals(yans);
		User user = dao.login(userName,password);
		request.getSession().setAttribute("user", user);
		if(user !=null &&f1) {
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/main.html");
		}else {
			response.sendRedirect(request.getContextPath() + "/login.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
