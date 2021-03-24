package com.me.dao;

import com.me.domain.XvQiu;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

/**
 * @Auther: wzs
 * @Date: 2020/10/21 18:39
 * @Description:
 */
public class ShenHeDao {

    public boolean shenhe(XvQiu xvQiu) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="update t_dcwjxx set sfsh = ?,yj=?   where wjid=? ";
        int n = 0;
        try {
            n = qr.update(sql,xvQiu.getSfsh(),xvQiu.getYj(),xvQiu.getWjid());
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
