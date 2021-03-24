package com.me.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.me.domain.XvQiu;
import com.me.utils.DBUtils;

public class XvQiuDao {

	public boolean createXvQiu(XvQiu xvQiu) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "insert into t_dcwjxx values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int update = qr.update(sql,xvQiu.getWjid(),xvQiu.getJgmc(),xvQiu.getTxdz(),xvQiu.getDwwz(),xvQiu.getDzyx(),xvQiu.getFrdb(),xvQiu.getYzbm(),xvQiu.getLxr(),xvQiu.getGddh(),xvQiu.getYddh(),xvQiu.getCz(),xvQiu.getJgsx(),xvQiu.getJgjj(),xvQiu.getJsxqmc(),
				xvQiu.getGjz(),xvQiu.getYjlx(),xvQiu.getXkfl(),xvQiu.getXqjsssly(),xvQiu.getXqjsyyhy(),xvQiu.getJsxqmc(),xvQiu.getZjxqze(),xvQiu.getZyzj(),xvQiu.getSfsh(),xvQiu.getQsxqnf(),xvQiu.getJzxqnf(),xvQiu.getQtjsms(),xvQiu.getGkglbm(),xvQiu.getSzdy(),
				xvQiu.getZywt(),xvQiu.getJsgj(),xvQiu.getTqmb(),xvQiu.getYj(),xvQiu.getDate());
		if (update > 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<XvQiu> searchAll() throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx ";
		List<XvQiu> query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
		return query;
	}

	public boolean deletexiqiu(String id) throws SQLException {
		QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
		String sql="delete from t_dcwjxx  where id=? ";
		int n = qr.update(sql,id);
		if (n > 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<XvQiu> qltd(String title, String from, String to) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx where 1=1 ";
		if(title!=null) {
			sql +="and title like  '%" +title+"%'";
		}else if(from!=null) {
			sql +="and date > " +from;
		}else if(to!=null) {
			sql +="and date < " +to;
		}
		List<XvQiu> query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
		
		return query;
	}

	public List<XvQiu> sw() throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx where statuX = '未审核'";
		List<XvQiu> query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
		return query;
	}

	public boolean xssh(String shjg, String shyj,String title) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "update t_dcwjxx set statuX = ? ,shyj = ? where title =?";
		int n = qr.update(sql, shjg, shyj,title);
		if(n>0) {
			return true;
		}else {
			return false;
		}
	}

	public List<XvQiu> xqgl(String jgmc, String szdy, String jsxqmc, String gkglbm, String jgsx, String yjlx) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx where 1=1 ";
		if(jgmc!=null) {
			sql +="and jgmc like  '%" +jgmc+"%'";
		}else if(szdy!=null) {
			sql +="and szdy like  '%" +szdy+"%'";
		}else if(jsxqmc!=null) {
			sql +="and jsxqmc like  '%" +jsxqmc+"%'";
		}else if(gkglbm!=null) {
			sql +="and gkglbm like  '%" +gkglbm+"%'";
		}else if(jgsx!=null) {
			sql +="and jgsx like  '%" +jgsx+"%'";
		}else if(yjlx!=null) {
			sql +="and yjlx like  '%" +yjlx+"%'";
		}
		List<XvQiu> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return query;
	}

	public XvQiu queryById(String wjid) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx where wjid=?";
		XvQiu query = null;
		try {
			query = qr.query(sql, new BeanHandler<XvQiu>(XvQiu.class),wjid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}
}
