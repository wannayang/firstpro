package com.ygcx.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Sys001b entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys001b", catalog = "ygcx")
public class Sys001b implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 4658669974818981666L;
	private Sys001bId id;
	private String bak;

	// Constructors

	/** default constructor */
	public Sys001b() {
	}

	/** minimal constructor */
	public Sys001b(Sys001bId id) {
		this.id = id;
	}

	/** full constructor */
	public Sys001b(Sys001bId id, String bak) {
		this.id = id;
		this.bak = bak;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "fl", column = @Column(name = "FL", nullable = false, length = 20)),
			@AttributeOverride(name = "value", column = @Column(name = "VALUE", nullable = false, length = 100)) })
	public Sys001bId getId() {
		return this.id;
	}

	public void setId(Sys001bId id) {
		this.id = id;
	}

	@Column(name = "BAK", length = 50)
	public String getBak() {
		return this.bak;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

}