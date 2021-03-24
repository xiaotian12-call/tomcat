package com.me.dao;

import com.me.domain.Line;
import com.me.domain.Xse;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2020/11/29 09:34
 * @Description:
 */
public class Jxcs {

    public List<Xse> getXse( String n) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select  * from one order by xse desc limit "+n;
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        List<Xse> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<Xse>(Xse.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    private static List<Xse> list = new ArrayList<Xse>();

    public static void read(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        //String [] le = {"city","date","day","traffic","type","id"};
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;

            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {

                String[] data = tempString.split("\t");
                //dao.xse(data);
                Xse x = new Xse();

                list.add(x);


            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
    }

    public static void main(String[] args) {
        read("D:/mroutput/jxcs1/part-r-00000");
        
    }

    public List<Xse> getXsl(String num) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select  * from one order by xsl desc limit "+num;
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        List<Xse> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<Xse>(Xse.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public List<Xse> getPagerank(String num) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select  * from two order by pagerank desc limit "+num;
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        List<Xse> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<Xse>(Xse.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public List<Xse> getYll(String num) {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select  * from three order by yll desc limit "+num;
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        List<Xse> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<Xse>(Xse.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }
    //select dlr,hkgs from one where dlr in (select dlr from (select dlr from two order by hyd desc limit 50) as t)
    public List<Line> getLine() {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select dlr,hkgs from one where dlr in (select dlr from (select dlr from two order by pagerank desc limit 10) as t)";
        //String sql = "select ? ?,count(*) num from t_dcwjxx where ? = ?";
        System.out.println(sql);
        List<Line> query = null;
        try {
            query = qr.query(sql, new BeanListHandler<Line>(Line.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }
}
