package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.UserDao;
import com.me.domain.Power;
import com.me.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/PowerServlet")
public class PowerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao = new UserDao();
    public PowerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//String method = request.getParameter("method");
		Power power = null;
		User user = (User)request.getSession().getAttribute("user");
		try {
			power = dao.getP(user.getPower());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		if(power==null){
			response.getWriter().write("0");
		}
		String item = gson.toJson(power);
		System.out.println(item);
		response.getWriter().write("["+item+"]");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
