package com.wipro.bean;

public class Register {

	String name;
	String email;
	String password;
	String phone;
	String address;
	String userType;

	public Register(String name, String email, String password, String phone, String address, String userType) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.userType = userType;
	}

	public Register() {
		super();
	}

	@Override
	public String toString() {
		return "Register [name=" + name + ", email=" + email + ", password=" + password + ", phone=" + phone
				+ ", address=" + address + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
