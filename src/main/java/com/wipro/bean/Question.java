package com.wipro.bean;

public class Question {

	String question;
	String a;
	String b;
	String c;
	String d;
	String ans;

	public Question(String question, String a, String b, String c, String d, String ans) {
		super();
		this.question = question;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.ans = ans;
	}

	public Question() {
		super();
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

}
