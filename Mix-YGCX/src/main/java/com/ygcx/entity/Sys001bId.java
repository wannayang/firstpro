package com.ygcx.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Sys001bId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class Sys001bId implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -7977614610833768379L;
	private String fl;
	private String value;

	// Constructors

	/** default constructor */
	public Sys001bId() {
	}

	/** full constructor */
	public Sys001bId(String fl, String value) {
		this.fl = fl;
		this.value = value;
	}

	// Property accessors

	@Column(name = "FL", nullable = false, length = 20)
	public String getFl() {
		return this.fl;
	}

	public void setFl(String fl) {
		this.fl = fl;
	}

	@Column(name = "VALUE", nullable = false, length = 100)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Sys001bId))
			return false;
		Sys001bId castOther = (Sys001bId) other;

		return ((this.getFl() == castOther.getFl()) || (this.getFl() != null
				&& castOther.getFl() != null && this.getFl().equals(
				castOther.getFl())))
				&& ((this.getValue() == castOther.getValue()) || (this
						.getValue() != null && castOther.getValue() != null && this
						.getValue().equals(castOther.getValue())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getFl() == null ? 0 : this.getFl().hashCode());
		result = 37 * result
				+ (getValue() == null ? 0 : this.getValue().hashCode());
		return result;
	}

}