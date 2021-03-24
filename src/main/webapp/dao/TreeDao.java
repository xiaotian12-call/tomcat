package com.me.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.me.utils.DBUtils;
import com.me.domain.Tree;
import com.me.domain.xkfl;
import com.me.domain.Xqjsyyhy;

/**
 * @author 王正帅
 * @date: 2020年10月7日 下午5:05:16 
 * 
 */
public class TreeDao {

	public List<xkfl> list(String parent) throws SQLException {
		// 1.创建核心类QueryRunner
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		// 2.编写SQL语句
		String sql = "select * from xkfl";
		// 3.执行查询操作
		List<xkfl> list = qr.query(sql, new BeanListHandler<xkfl>(xkfl.class));
		return list;
	}
	public List<xkfl> listx() throws SQLException {
		// 1.创建核心类QueryRunner
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		// 2.编写SQL语句
		String sql = "select * from xkfl";
		// 3.执行查询操作
		List<xkfl> list = qr.query(sql, new BeanListHandler<xkfl>(xkfl.class));
		return list;
	}
	public List<Xqjsyyhy> listxq() throws SQLException {
		// 1.创建核心类QueryRunner
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		// 2.编写SQL语句
		String sql = "select * from gc";
		// 3.执行查询操作
		List<Xqjsyyhy> list = qr.query(sql, new BeanListHandler<Xqjsyyhy>(Xqjsyyhy.class));
		return list;
	}
	public List<Tree> list(int parent) throws SQLException {
		// 1.创建核心类QueryRunner
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		// 2.编写SQL语句
		String sql = "select * from xkfl where pid=?";
		// 3.执行查询操作
		List<Tree> list = qr.query(sql, new BeanListHandler<Tree>(Tree.class), parent);
		return list;
	}
	public int parent(int pid) throws SQLException {
		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
		String sql = "select count(*) from xkfl where pid=?";
		Long query = (Long) runner.query(sql, new ScalarHandler(), pid);
		return query.intValue();
	}

	public Tree cha(String id) throws SQLException {
		// 1.创建核心类QueryRunner
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		// 2.编写SQL语句
		String sql = "select * from xkfl where id=?";
		// 3.执行查询操作
		Tree tree = qr.query(sql, new BeanHandler<Tree>(Tree.class), id);
		return tree;
	}

}
