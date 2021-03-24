package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.XvQiuDao;
import com.me.domain.PageBean;
import com.me.domain.User;
import com.me.domain.XvQiu;
import com.me.utils.Data;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/templete/xvqiu")
public class XvQiuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XvQiuServlet() {
        super();
    }
    XvQiuDao dao = new XvQiuDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String method = request.getParameter("method");
		System.out.println(method);
		if(method.equals("createXvQiu")) {
			try {
				createXvQiu(request, response);
			} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("searchAll")){
			try {
				searchAll(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("deletexvqiu")){
			try {
				deletexvqiu(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("xqgl")){
			try {
				xqgl(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("sw")){
			try {
				sw(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("xssh")){
			try {
				xssh(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(method.equals("createXvQiu2")){
			try {
				createXvQiu2(request, response);
			} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(method.equals("queryById")){
			queryById(request,response);
		}else if(method.equals("queryById0")){
			queryById0(request,response);
		}else if(method.equals("changexq")){
			changexq(request,response);
		}else if(method.equals("changexq2")){
			changexq2(request,response);
		}else if(method.equals("xsallxq")){
			xsallxq(request,response);
		}else if(method.equals("bmsh")){
			bmsh(request,response);
		}else if(method.equals("page")){
			page(request,response);
		}else if(method.equals("queryById2")){
			queryById2(request,response);
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr==null) currentPageStr="1";
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount = 12;

		//封装一个PageBean 返回web层
		PageBean pageBean = new PageBean();
		//1、封装当前页
		pageBean.setCurrentPage(currentPage);
		//2、封装每页显示的条数
		pageBean.setCurrentCount(currentCount);
		//3、封装总条数
		int totalCount = 0;
		totalCount = dao.getCount();
		pageBean.setTotalCount(totalCount);
		//4、封装总页数
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		//5、当前页显示的数据
		// select * from product where cid=? limit ?,?
		// 当前页与起始索引index的关系
		int index = (currentPage-1)*currentCount;
		List<XvQiu> list = null;
		list = dao.findProductByPage(index,currentCount);
		pageBean.setList(list);

		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("mywj2.jsp").forward(request, response);
	}

	private void bmsh(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User user = (User) request.getSession().getAttribute("user");
		String bmsh = user.getBmsh();
		List<XvQiu> xvQiuList = dao.queryByBmsh(bmsh);
		request.setAttribute("xvQiuList",xvQiuList);
		if(xvQiuList==null) {
			response.getWriter().write("加载失败！");
		}else {
			request.getRequestDispatcher("bmsh2.jsp").forward(request, response);
		}
	}

	private void xsallxq(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr==null) currentPageStr="1";
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount = 12;

		//封装一个PageBean 返回web层
		PageBean pageBean = new PageBean();
		//1、封装当前页
		pageBean.setCurrentPage(currentPage);
		//2、封装每页显示的条数
		pageBean.setCurrentCount(currentCount);
		//3、封装总条数
		int totalCount = 0;
		totalCount = dao.getCount();
		pageBean.setTotalCount(totalCount);
		//4、封装总页数
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		//5、当前页显示的数据
		// select * from product where cid=? limit ?,?
		// 当前页与起始索引index的关系
		int index = (currentPage-1)*currentCount;
		List<XvQiu> list = null;
		list = dao.findProductByPage(index,currentCount);
		pageBean.setList(list);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("xssh2.jsp").forward(request, response);

	}

	private void changexq2(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		XvQiu xvQiu = new XvQiu();
		try {
			BeanUtils.populate(xvQiu, map);
			boolean f= dao.changexq(xvQiu);
			if(f){
				request.setAttribute("f","1");
				request.getRequestDispatcher("changexq.jsp").forward(request,response);
			}else {
				request.setAttribute("f","0");
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void changexq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wjid = request.getParameter("wjid");
		XvQiu xvQiu = dao.queryById(wjid);
		request.setAttribute("xvqiu",xvQiu);
		request.getRequestDispatcher("changexq.jsp").forward(request,response);
	}

	private void queryById0(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wjid = request.getParameter("wjid");
		XvQiu xvQiu = dao.queryById(wjid);
		request.setAttribute("xvqiu",xvQiu);
		request.getRequestDispatcher("mybb.jsp").forward(request,response);
	}

	private void queryById2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wjid = request.getParameter("wjid");
		XvQiu xvQiu = dao.queryById(wjid);
		request.setAttribute("xvqiu",xvQiu);
		request.getRequestDispatcher("bmsh3.jsp").forward(request,response);
	}

	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wjid = request.getParameter("wjid");
		XvQiu xvQiu = dao.queryById(wjid);
		request.setAttribute("xvqiu",xvQiu);
		request.getRequestDispatcher("shxq.jsp").forward(request,response);
	}

	private void xssh(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
		String shjg = request.getParameter("shjg");
		String shyj = request.getParameter("shyj");
		String title = request.getParameter("title");
		boolean f = dao.xssh(shjg,shyj,title);
		if(f) {
			sw(request, response);
		}else {
			response.getWriter().write("加载失败！");
		}
	}

	private void sw(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
		List<XvQiu> xvQiuList = dao.sw();
		request.setAttribute("xvQiuList", xvQiuList);
		//System.out.println(xvQiuList.get(0).getModel()+"123");
		if(xvQiuList.isEmpty()) {
			response.getWriter().write("加载失败！");
		}else {
			request.getRequestDispatcher("xssh2.jsp").forward(request, response);
		}
	}

	private void xqgl(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
		String jgmc = request.getParameter("jgmc");
		String szdy = request.getParameter("szdy");
		String jsxqmc = request.getParameter("jsxqmc");
		String gkglbm = request.getParameter("gkglbm");
		String jgsx = request.getParameter("jgsx");
		String yjlx = request.getParameter("yjlx");
		List<XvQiu> xvQiuList = dao.xqgl(jgmc,szdy,jsxqmc,gkglbm,jgsx,yjlx);
		request.setAttribute("xvQiuList", xvQiuList);
		//System.out.println(xvQiuList.get(0).getModel()+"123");
		if(xvQiuList==null) {
			response.getWriter().write("加载失败！");
		}else {
			request.getRequestDispatcher("mywj2.jsp").forward(request, response);
		}
	}

	private void deletexvqiu(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
		String id = request.getParameter("wjid");
		boolean f = dao.deletexiqiu(id);
		System.out.println(id);
		response.getWriter().write("{\"f\":"+f+"}");
	}

	private void searchAll(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		List<XvQiu> xvQiuList = dao.searchAll();
		request.setAttribute("xvQiuList", xvQiuList);
		//System.out.println(xvQiuList.get(0).getModel()+"123");
		if(xvQiuList.isEmpty()) {
			response.getWriter().write("加载失败！");
		}else {
			request.getRequestDispatcher("mywj2.jsp").forward(request, response);
		}
	}

	private void createXvQiu2(HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, InvocationTargetException, SQLException, IOException {
		Map<String, String[]> map = request.getParameterMap();
		XvQiu xvQiu = new XvQiu();
		BeanUtils.populate(xvQiu, map);
		String[] xqjsssly = request.getParameterValues("xqjsssly");
		if(xqjsssly!=null) {
			String xq111="";
			for (int i = 0; i < xqjsssly.length; i++) {
				xq111+=xqjsssly[i]+" ";
			}
			xvQiu.setXqjsssly(xq111);
		}
		
		String[] jsxqhzms = request.getParameterValues("jsxqhzms");
		String xq22="";
		if(jsxqhzms!=null){
			for (int i = 0; i < jsxqhzms.length; i++) {
				xq22+=jsxqhzms[i]+" ";
			}

			xvQiu.setJsxqmc(xq22);
		}

		
		xvQiu.setWjid(Integer.valueOf(Data.getId()));

		System.out.println(xvQiu.toString());
		boolean f = dao.createXvQiu(xvQiu);
		if(f) {
			response.getWriter().write("添加成功！");
		}else {
			response.getWriter().write("添加失败！");
		}
	}
	
	private void createXvQiu(HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, InvocationTargetException, SQLException, IOException, ServletException {
		Map<String, String[]> map = request.getParameterMap();
		XvQiu xvQiu = new XvQiu();
		BeanUtils.populate(xvQiu, map);
		xvQiu.setDate(Data.getDate());
		String[] xqjsssly = request.getParameterValues("xqjsssly");
		if(xqjsssly!=null) {
			String xq111="";
			for (int i = 0; i < xqjsssly.length; i++) {
				xq111+=xqjsssly[i]+" ";
			}
			xvQiu.setXqjsssly(xq111);
		}
		
		String[] jsxqhzms = request.getParameterValues("jsxqhzms");
		String xq22="";
		for (int i = 0; i < jsxqhzms.length; i++) {
			xq22+=jsxqhzms[i]+" ";
		}
		
		xvQiu.setJsxqmc(xq22);;
		
		xvQiu.setWjid(Integer.valueOf(Data.getId()));
		if(xvQiu.getJgsx()==null) {
			xvQiu.setJgsx("");
		}
		if(xvQiu.getJsxqmc()==null) {
			xvQiu.setJsxqmc("");
		}
		
		if(xvQiu.getGjz()==null) {
			xvQiu.setGjz("");
		}
		if(xvQiu.getJgsx()==null) {
			xvQiu.setJgsx("");
		}
		if(xvQiu.getYjlx()==null) {
			xvQiu.setYjlx("");
		}
		
		//System.out.println(xvQiu.toString());
		//boolean f = dao.createXvQiu(xvQiu);
		Gson gson = new Gson();
		String json = gson.toJson(xvQiu);
		request.getSession().setAttribute("xq", json);
		
		request.getRequestDispatcher("").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
