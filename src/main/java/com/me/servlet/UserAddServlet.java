package com.me.servlet;

import com.me.dao.UserDao;
import com.me.domain.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/zhu/user")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao = new UserDao();
    
	
	
    public UserAddServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if(method.equals("zhuce")) {
			try {
				zhuce(request,response);
			} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("checkUsername")) {
			try {
				checkUsername(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws IOException 
	 */
	private void checkUsername(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String username = request.getParameter("username");
		User checkU = dao.checkU(username);
		if(checkU==null) {
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
		
	}

	private void zhuce(HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, InvocationTargetException, SQLException, IOException {
		Map<String, String[]> map = request.getParameterMap();
		User user =new User();
//		String sheng = request.getParameter("gj");
//		String shi = request.getParameter("ss");
		BeanUtils.populate(user, map);
		System.out.println(user.toString());
		boolean f=dao.addUser(user);
		if(f) {
			response.getWriter().write("<h1>注册成功，快去登录吧！</h1>");;
		}else {
			response.sendRedirect(request.getContextPath() + "/register.html");
			//request.getRequestDispatcher(request.getContextPath() + "/register.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
