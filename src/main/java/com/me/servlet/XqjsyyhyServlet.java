package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.TreeDao;
import com.me.domain.Xqjsyyhy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/templete/xqjsyyhy")
public class XqjsyyhyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 TreeDao dao = new TreeDao();
    
    public XqjsyyhyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<Xqjsyyhy> listx = new ArrayList<Xqjsyyhy>();
		try {
			listx = dao.listxq();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson gson = new Gson();
		String ss = gson.toJson(listx);
		response.getWriter().write(ss);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
