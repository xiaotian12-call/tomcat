package com.me.dao;

import com.me.domain.Tjtb;
import com.me.domain.XvQiu;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2020/10/21 20:05
 * @Description:
 */
public class ChaXunDao {

    public List<XvQiu> flcx(String sxzt, String bytj, String bytjz, String sfmh, String qxsj, String jzsj) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from t_dcwjxx where 1=1 ";
        if(sfmh.equals("1")){
            if(bytj!=null){
                sql += " and "+bytj +" like '%"+bytjz+"%'";
            }
        }else {
            if(bytj!=null){
                sql += " and "+bytj +" = '"+bytjz+"'";
            }
        }
        if(qxsj!=null&&!qxsj.equals("")){
            sql += "and date > '" +qxsj+"' and date < '"+jzsj+"'";
        }
        List<XvQiu> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public List<XvQiu> zhjs(String sql, String qxsj, String jzsj) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        if(qxsj!=null&&!qxsj.equals("")){
            sql += " and date > '" +qxsj+"' and date < '"+jzsj+"'";
        }
        System.out.println(sql);
        List<XvQiu> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<XvQiu>(XvQiu.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public  List<Tjtb> tj(String tjzd){
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select "+tjzd+" tjzdz from t_dcwjxx";
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        List<Tjtb> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<Tjtb>(Tjtb.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }


    public  Tjtb tjtb(String tjzd,String tjzdz) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select "+tjzd+" "+tjzd+" ,count(*) num from t_dcwjxx where "+tjzd+" = '"+tjzdz+"'";
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        Tjtb query = null;
        try {
            query = qr.query(sql, new BeanHandler<Tjtb>(Tjtb.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public static void main(String[] args) {
//        List<Tjtb> jgsx = tj("jgsx");
//        System.out.println(jgsx.get(0).getTjzdz());
//        Tjtb jgsx = tjtb("jgsx","高校");
//        System.out.println(jgsx.getNum());
//        System.out.println(jgsx.getJgsx());
    }
}
