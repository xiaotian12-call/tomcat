package com.me.servlet;

import com.me.dao.TreeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/templete/tree")
public class TreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    TreeDao dao = new TreeDao();
    public TreeServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*request.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if(method!=null&&method.equals("xinxi")) {
			try {
				xinxi(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("ztree");
		String ss=null;
		int f=0;
		String pid = request.getParameter("id");
		System.out.println(pid);
		if(pid==null) {
			pid="0";
		}
		try {
			List<Tree> list = dao.list( pid);
			for (Tree tree : list) {
				f = dao.parent( tree.getId());
				if(f>0) {
					tree.setIsParent(true);
				}
			}
			Gson gson = new Gson();
			ss = gson.toJson(list);
			//ss = JSONArray.fromObject(list).toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.getWriter().write(ss);
	}
	private void xinxi(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String id = request.getParameter("id");
		Tree tree = dao.cha(id);
		int f = dao.parent( tree.getId());
		if(f>0) {
			tree.setIsParent(true);
		}
		List<Tree> t_list = dao.list( tree.getId());
		request.setAttribute("tree", tree);
		request.setAttribute("t_list", t_list);
		//request.setAttribute("message", "添加成功");
		request.getRequestDispatcher("rigth.jsp").forward(request,response);
	}*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
