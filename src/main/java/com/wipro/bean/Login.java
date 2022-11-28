package com.wipro.bean;

public class Login {

	String name;
	String pass;

	public Login(String name, String pass) {
		super();
		this.name = name;
		this.pass = pass;
	}

	public Login() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "Login [name=" + name + ", pass=" + pass + "]";
	}
}
