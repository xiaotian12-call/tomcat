package com.me.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.me.domain.Power;
import com.me.domain.User;
import com.me.utils.DBUtils;

public class UserDao {

	public boolean addUser(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "insert into user (username,password,phone,company,name,sex,sheng,zyfx,szhy,jycd,zc,txdz,yzbm,email,qq,msn,shi,gddh,sfzh) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int update = qr.update(sql,user.getUsername(),user.getPassword(),user.getPhone(),user.getCompany(),user.getName(),user.getSex(),user.getSheng(),user.getZyfx(),
				user.getSzhy(),user.getJycd(),user.getZc(),user.getTxdz(),user.getYzbm(),user.getEmail(),user.getQq(),user.getMsn(),user.getShi(),user.getGddh(),user.getSfzh());
		if (update > 0) {
			return true;
		} else {
			return false;
		}
	}

	public User login(String userName, String password) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from user where userName=? and password=? ";
		User user01 = qr.query(sql, new BeanHandler<User>(User.class), userName, password);
		return user01;
	}
	public User checkU(String userName) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from user where username=? ";
		User user01 = qr.query(sql, new BeanHandler<User>(User.class), userName);
		return user01;
	}
	public User checkP(String password) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from user where  password=? ";
		User user01 = qr.query(sql, new BeanHandler<User>(User.class), password);
		return user01;
	}

	public Power getP(int power) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from power where  power = ? ";
		Power power1 = qr.query(sql, new BeanHandler<Power>(Power.class), power);
		return power1;
	}
	
	public User changePassword(String password, int id) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "update user set password = ? where id =?";
		int n = qr.update(sql, password, id);
		if(n>0) {
			User user = checkP(password);
			return user;
		}else {
			return null;
		}
	}
}
