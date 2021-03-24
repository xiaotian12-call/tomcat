package com.me.dao;

import com.me.domain.XvQiu;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class XvQiuDao {

	public boolean createXvQiu(XvQiu xvQiu) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "insert into t_dcwjxx values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int update = qr.update(sql,xvQiu.getWjid(),xvQiu.getJgmc(),xvQiu.getTxdz(),xvQiu.getFrdb(),xvQiu.getZywt(),
				xvQiu.getGddh(),xvQiu.getYddh(),xvQiu.getCz(),xvQiu.getJgsx(),xvQiu.getJgjj(),xvQiu.getJsxqmc(),
				xvQiu.getGjz(),xvQiu.getYjlx(),xvQiu.getXkfl(),xvQiu.getXqjsssly(),xvQiu.getXqjsyyhy(),xvQiu.getJsxqhzms(),
				xvQiu.getLxr(),xvQiu.getZjxqze(),xvQiu.getZyzj(),xvQiu.getSfsh(),xvQiu.getQsxqnf(),xvQiu.getJzxqnf(),xvQiu.getQtjsms(),
				xvQiu.getGkglbm(),xvQiu.getSzdy(),xvQiu.getJsgj(),xvQiu.getTqmb(),xvQiu.getYj(),xvQiu.getDate(),xvQiu.getBmsh(),xvQiu.getBmshyj(),
				xvQiu.getDwwz(),xvQiu.getDzyx(),xvQiu.getYzbm());

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
		String sql="delete from t_dcwjxx  where wjid=? ";
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

	public boolean changexq(XvQiu xvQiu) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "update t_dcwjxx set txdz = ? ,dwwz = ? ,  dzyx = ? ,frdb = ? ,YZBM = ? ,LXR = ? ,  GDDH = ? ,YDDH = ? ,"+
				" CZ = ? ,JGSX = ? ,  JGJJ = ? ,JSXQMC = ? ,GJZ = ? ,YJLX = ? ,  XKFL = ? ,XQJSSSLY = ? ,"+
				"XQJSYYHY = ? ,JSXQHZMS = ? ,  ZJXQZE = ? ,JSXQMC = ? ,ZYZJ = ? ,QSXQNF = ? ,  JZXQNF = ? ,QTJSMS = ? ,"+
				"GKGLBM = ? ,SZDY = ? ,  ZYWT = ? ,TQMB = ?,BMSG = ?"
				+"where wjid =?";
		int n = qr.update(sql,xvQiu.getTxdz(),xvQiu.getDwwz(),xvQiu.getDzyx(),xvQiu.getFrdb(),xvQiu.getYzbm(),xvQiu.getLxr(),xvQiu.getGddh(),xvQiu.getYddh()
		,xvQiu.getCz(),xvQiu.getJgsx(),xvQiu.getJgjj(),xvQiu.getJsxqmc(),xvQiu.getGjz(),xvQiu.getYjlx(),xvQiu.getXkfl(),xvQiu.getXqjsssly()
		,xvQiu.getXqjsyyhy(),xvQiu.getJsxqhzms(),xvQiu.getZjxqze(),xvQiu.getJsxqmc(),xvQiu.getZyzj(),xvQiu.getQsxqnf(),xvQiu.getJzxqnf(),xvQiu.getQtjsms()
		,xvQiu.getGkglbm(),xvQiu.getSzdy(),xvQiu.getZywt(),xvQiu.getTqmb(),xvQiu.getBmsh(),xvQiu.getWjid());
		if(n>0) {
			return true;
		}else {
			return false;
		}
	}

	public List<XvQiu> xsallxq() {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx where sfsh = 0";
		List<XvQiu> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}

	public List<XvQiu> queryByBmsh(String bmsh) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx where sfsh = 1 and bmsh = ?";
		List<XvQiu> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class),bmsh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}

	public int getCount() {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx  ";
		List<XvQiu> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return query.size();
	}

	public List<XvQiu> findProductByPage( int index, int currentCount) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_dcwjxx limit ?,?";
		List<XvQiu> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class),index,currentCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}
}
