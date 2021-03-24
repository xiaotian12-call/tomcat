package com.me.dao;

import com.me.domain.Power;
import com.me.domain.User;
import com.me.domain.XvQiu;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2020/10/19 20:21
 * @Description:
 */
public class AdminDao {

    public List<User> chaAllUser() {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from user";
        List<User> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<User>(User.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public boolean stop(String id) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="update user set statu = 0   where id=? ";
        int n = 0;
        try {
            n = qr.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean start(String id) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="update user set statu = 1   where id=? ";
        int n = 0;
        try {
            n = qr.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean delete(String id) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="delete from user  where id=? ";
        int n = 0;
        try {
            n = qr.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public User query(String id) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from user where id=? ";
        User user01 = null;
        try {
            user01 = qr.query(sql, new BeanHandler<User>(User.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user01;
    }

    public Power power(int id) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from power where  power = ? ";
        Power power = null;
        try {
            power = qr.query(sql, new BeanHandler<Power>(Power.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return power;
    }
    public Power power(String power) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from power where  power = ? ";
        Power power1 = null;
        try {
            power1 = qr.query(sql, new BeanHandler<Power>(Power.class), power);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return power1;
    }

    public boolean changePower(String id, Power power) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="update power set power = ? , xqzj_qx = ? ,xqgl_qx=? ,yhxx_qx=? ,yhxg_qx=? ,xssh_qx=? ,mmcz_qx=? ,tjcx_qx=? where uid=? ";
        int n = 0;
        try {
            n = qr.update(sql,power.getPower(),power.getXqzj_qx(),power.getXqgl_qx(),power.getYhxx_qx(),power.getYhxg_qx(),power.getXssh_qx(),power.getMmcz_qx(),power.getTjcx_qx(),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }
    public boolean changePower(String id, String power) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="update user set power = ?  where id=? ";
        int n = 0;
        try {
            n = qr.update(sql,power,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean addJs(Power power) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="insert into power values(?,?,?,?,?,?,?,?,?) ";
        int n = 0;
        try {
            n = qr.update(sql,power.getPower(),power.getXqzj_qx(),power.getXqgl_qx(),
                    power.getYhxx_qx(),power.getYhxg_qx(),power.getXssh_qx(),
                    power.getMmcz_qx(),power.getTjcx_qx(),power.getPowername());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

}
