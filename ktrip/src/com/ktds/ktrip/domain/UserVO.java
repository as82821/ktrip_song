package com.ktds.ktrip.domain;

/*
 * »ç¿ëÀÚ VO
 */
public class UserVO {
	private int num_id;
	private String id;
	private String pwd;
	private String name;
	private String phone_num;
	private String email;
	private String sex;
	private String national;
	private String residential_contry;
	private int type;

	public int getNum_id() {
		return num_id;
	}

	public void setNum_id(int num_id) {
		this.num_id = num_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public String getResidential_contry() {
		return residential_contry;
	}

	public void setResidential_contry(String residential_contry) {
		this.residential_contry = residential_contry;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "UserVO [num_id=" + num_id + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", phone_num="
				+ phone_num + ", email=" + email + ", sex=" + sex + ", national=" + national + ", residential_contry="
				+ residential_contry + ", type=" + type + "]";
	}

}
