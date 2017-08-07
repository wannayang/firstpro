package com.ygcx.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Worklog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "worklog", catalog = "ygcx")
public class Worklog implements java.io.Serializable {

	// Fields

	private Integer id;
	private String cph;
	private String tbnf;
	private String lb;
	private Date logdate;
	private String res;
	private String bak;
	private String czr;

	// Constructors

	/** default constructor */
	public Worklog() {
	}

	/** full constructor */
	public Worklog(String cph, String tbnf, String lb, Date logdate,
			String res, String bak, String czr) {
		this.cph = cph;
		this.tbnf = tbnf;
		this.lb = lb;
		this.logdate = logdate;
		this.res = res;
		this.bak = bak;
		this.czr = czr;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "CPH", length = 8)
	public String getCph() {
		return this.cph;
	}

	public void setCph(String cph) {
		this.cph = cph;
	}

	@Column(name = "TBNF", length = 10)
	public String getTbnf() {
		return this.tbnf;
	}

	public void setTbnf(String tbnf) {
		this.tbnf = tbnf;
	}

	@Column(name = "LB", length = 5)
	public String getLb() {
		return this.lb;
	}

	public void setLb(String lb) {
		this.lb = lb;
	}

	@Column(name = "LOGDATE", length = 19)
	public Date getLogdate() {
		return this.logdate;
	}

	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}

	@Column(name = "RES", length = 2)
	public String getRes() {
		return this.res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	@Column(name = "BAK", length = 4000)
	public String getBak() {
		return this.bak;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

	@Column(name = "CZR", length = 20)
	public String getCzr() {
		return this.czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
	}

}