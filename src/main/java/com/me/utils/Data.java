package com.me.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 王正帅
 * @date: 2020年10月7日 上午10:57:40 
 * 
 */
public class Data {
	private static SimpleDateFormat sdf = new SimpleDateFormat("ddHHmmss");
    public static String getId(){
    	Date date = new Date();
    	String resu = sdf.format(date);
    	return resu;
    }
    public static String getDate(){
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		return df.format(new Date());
	}
    public static void main(String[] args) {
		System.out.println(getId());
		System.out.println(getDate());

	}

}
