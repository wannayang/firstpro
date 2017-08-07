package com.ygcx.model;

import java.io.Serializable;

public class BasevalModel implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1095055680443911538L;
	/**
	 * 
	 */
	private String fl;
	private String value;
	private String bak;
	private String czsfzh;
	private String oper;
	
	public String getFl() {
		return fl;
	}
	public void setFl(String fl) {
		this.fl = fl;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getBak() {
		return bak;
	}
	public void setBak(String bak) {
		this.bak = bak;
	}
	public String getCzsfzh() {
		return czsfzh;
	}
	public void setCzsfzh(String czsfzh) {
		this.czsfzh = czsfzh;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}
	 
	
}
