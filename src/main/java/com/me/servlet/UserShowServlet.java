package com.me.servlet;

import com.me.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userShowServlet")
public class UserShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserShowServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//String method = request.getParameter("method");
		User user = (User)request.getSession().getAttribute("user");
		
		response.getWriter().write("{'status':'OK', 'name':"+user.getUsername()+"}");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
