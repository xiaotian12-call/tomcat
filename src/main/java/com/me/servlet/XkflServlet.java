package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.TreeDao;
import com.me.domain.xkfl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class XkflServlet
 */
@WebServlet("/templete/xkfl")
public class XkflServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    TreeDao dao = new TreeDao();
    public XkflServlet() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<xkfl> listx = new ArrayList<xkfl>();
		try {
			listx = dao.list("0");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson gson = new Gson();
		String ss = gson.toJson(listx);
		response.getWriter().write(ss);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
