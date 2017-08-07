package com.ygcx.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Tb001Id entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class Tb001Id implements java.io.Serializable {

	// Fields

	private String cph;
	private String tbnf;

	// Constructors

	/** default constructor */
	public Tb001Id() {
	}

	/** full constructor */
	public Tb001Id(String cph, String tbnf) {
		this.cph = cph;
		this.tbnf = tbnf;
	}

	// Property accessors

	@Column(name = "CPH", nullable = false, length = 8)
	public String getCph() {
		return this.cph;
	}

	public void setCph(String cph) {
		this.cph = cph;
	}

	@Column(name = "TBNF", nullable = false, length = 10)
	public String getTbnf() {
		return this.tbnf;
	}

	public void setTbnf(String tbnf) {
		this.tbnf = tbnf;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Tb001Id))
			return false;
		Tb001Id castOther = (Tb001Id) other;

		return ((this.getCph() == castOther.getCph()) || (this.getCph() != null
				&& castOther.getCph() != null && this.getCph().equals(
				castOther.getCph())))
				&& ((this.getTbnf() == castOther.getTbnf()) || (this.getTbnf() != null
						&& castOther.getTbnf() != null && this.getTbnf()
						.equals(castOther.getTbnf())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCph() == null ? 0 : this.getCph().hashCode());
		result = 37 * result
				+ (getTbnf() == null ? 0 : this.getTbnf().hashCode());
		return result;
	}

}