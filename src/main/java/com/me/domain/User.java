package com.me.domain;

public class User {
	/*<!-- 1、用户注册：首次用户使用需要进行注册，然后登录本系统。（1.5分）
	（1）用户注册需要填报用户姓名、密码、重复密码、手机号码、所属单位五项内容（0.5分）；
	（2）验证密码和重复密码保持一致（0.5分）；
	（3）验证手机号码为11位数字。（0.5分） -->*/
	private int id;
	private int power;
	private String username;
	private String name;
	private String sex;
	private String sheng;
	private String shi;
	private String password;
	private String phone;
	private String company;
	private String zyfx;
	private String szhy;
	private String jycd;
	private String zc;
	private String txdz;
	private String yzbm;
	private String gddh;
	private String email;
	private String qq;
	private String msn;
	private String sfzh;
	private String bmsh;
	private int statu;

	public String getBmsh() {
		return bmsh;
	}

	public void setBmsh(String bmsh) {
		this.bmsh = bmsh;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}

	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getSheng() {
		return sheng;
	}
	public void setSheng(String sheng) {
		this.sheng = sheng;
	}
	public String getShi() {
		return shi;
	}
	public void setShi(String shi) {
		this.shi = shi;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getZyfx() {
		return zyfx;
	}
	public void setZyfx(String zyfx) {
		this.zyfx = zyfx;
	}
	public String getSzhy() {
		return szhy;
	}
	public void setSzhy(String szhy) {
		this.szhy = szhy;
	}
	public String getJycd() {
		return jycd;
	}
	public void setJycd(String jycd) {
		this.jycd = jycd;
	}
	public String getZc() {
		return zc;
	}
	public void setZc(String zc) {
		this.zc = zc;
	}
	public String getTxdz() {
		return txdz;
	}
	public void setTxdz(String txdz) {
		this.txdz = txdz;
	}
	public String getYzbm() {
		return yzbm;
	}
	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}
	public String getGddh() {
		return gddh;
	}
	public void setGddh(String gddh) {
		this.gddh = gddh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getMsn() {
		return msn;
	}
	public void setMsn(String msn) {
		this.msn = msn;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", power=" + power + ", username=" + username + ", name=" + name + ", sex=" + sex
				+ ", sheng=" + sheng + ", shi=" + shi + ", password=" + password + ", phone=" + phone + ", company="
				+ company + ", zyfx=" + zyfx + ", szhy=" + szhy + ", jycd=" + jycd + ", zc=" + zc + ", txdz=" + txdz
				+ ", yzbm=" + yzbm + ", gddh=" + gddh + ", email=" + email + ", qq=" + qq + ", msn=" + msn + "]";
	}
	
	

	
	
}
