package com.ygcx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Sys001a entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys001a", catalog = "ygcx")
public class Sys001a implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -3773062150044824113L;
	private String fl;
	private String bak;

	// Constructors

	/** default constructor */
	public Sys001a() {
	}

	/** minimal constructor */
	public Sys001a(String fl) {
		this.fl = fl;
	}

	/** full constructor */
	public Sys001a(String fl, String bak) {
		this.fl = fl;
		this.bak = bak;
	}

	// Property accessors
	@Id
	@Column(name = "FL", unique = true, nullable = false, length = 20)
	public String getFl() {
		return this.fl;
	}

	public void setFl(String fl) {
		this.fl = fl;
	}

	@Column(name = "BAK", length = 50)
	public String getBak() {
		return this.bak;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

}