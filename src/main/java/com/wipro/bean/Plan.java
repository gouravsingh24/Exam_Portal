package com.wipro.bean;

public class Plan {

	String account;
	String bank;
	String plan;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	public Plan(String account, String bank, String plan) {
		super();
		this.account = account;
		this.bank = bank;
		this.plan = plan;
	}

	public Plan() {
		super();
	}
}
