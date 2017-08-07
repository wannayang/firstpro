package com.ygcx.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Tb001 entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb001", catalog = "ygcx")
public class Tb001 implements java.io.Serializable {

	// Fields

	private Tb001Id id;
	private String xbnx;
	private String jfrq;
	private String qbrq;
	private String zbrq;
	private String czxm;
	private String czsfzh;
	private String czlxfs;
	private String jbrxm;
	private String jbrdh;
	private String dw;
	private String jb;
	private String cllx;
	private String cx;
	private String cjh;
	private String fdjh;
	private String cpys;
	private String bllb;
	private String syxz;
	private String cdrq;
	private String cbgs;
	private String syxbdh;
	private String jqxbdh;
	private String cbqd;
	private String syxsq;
	private String jqxsq;
	private String syxsh;
	private String jqxsh;
	private String bfzjesh;
	private String ccs;
	private String hccs;
	private String bhccs;
	private String flfbl;
	private String flffs1;
	private String flffs2;
	private String flffs3;
	private String flfzje;
	private String sjzfbfje;
	private String jszdzrq;
	private String czrq;
	private String czr;
	private String state;
		private String sjsbfje;
		private String flfdx;
		private String gh;
		private String bak;

	// Constructors

	/** default constructor */
	public Tb001() {
	}

	/** minimal constructor */
	public Tb001(Tb001Id id) {
		this.id = id;
	}

	/** full constructor */
	public Tb001(Tb001Id id, String xbnx, String jfrq, String qbrq,
			String zbrq, String czxm, String czsfzh, String czlxfs,
			String jbrxm, String jbrdh, String dw, String jb, String cllx,
			String cx, String cjh, String fdjh, String cpys, String bllb,
			String syxz, String cdrq, String cbgs, String syxbdh,
			String jqxbdh, String cbqd, String syxsq, String jqxsq,
			String syxsh, String jqxsh, String bfzjesh, String ccs,
			String hccs, String bhccs, String flfbl, String flffs1,
			String flffs2, String flffs3, String flfzje, String sjzfbfje,
			String jszdzrq, String czrq, String czr, String state,
			String sjsbfje, String flfdx, String gh, String bak) {
		this.id = id;
		this.xbnx = xbnx;
		this.jfrq = jfrq;
		this.qbrq = qbrq;
		this.zbrq = zbrq;
		this.czxm = czxm;
		this.czsfzh = czsfzh;
		this.czlxfs = czlxfs;
		this.jbrxm = jbrxm;
		this.jbrdh = jbrdh;
		this.dw = dw;
		this.jb = jb;
		this.cllx = cllx;
		this.cx = cx;
		this.cjh = cjh;
		this.fdjh = fdjh;
		this.cpys = cpys;
		this.bllb = bllb;
		this.syxz = syxz;
		this.cdrq = cdrq;
		this.cbgs = cbgs;
		this.syxbdh = syxbdh;
		this.jqxbdh = jqxbdh;
		this.cbqd = cbqd;
		this.syxsq = syxsq;
		this.jqxsq = jqxsq;
		this.syxsh = syxsh;
		this.jqxsh = jqxsh;
		this.bfzjesh = bfzjesh;
		this.ccs = ccs;
		this.hccs = hccs;
		this.bhccs = bhccs;
		this.flfbl = flfbl;
		this.flffs1 = flffs1;
		this.flffs2 = flffs2;
		this.flffs3 = flffs3;
		this.flfzje = flfzje;
		this.sjzfbfje = sjzfbfje;
		this.jszdzrq = jszdzrq;
		this.czrq = czrq;
		this.czr = czr;
		this.state = state;
		this.sjsbfje = sjsbfje;
		this.flfdx = flfdx;
		this.gh = gh;
		this.bak = bak;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "cph", column = @Column(name = "CPH", nullable = false, length = 8)),
			@AttributeOverride(name = "tbnf", column = @Column(name = "TBNF", nullable = false, length = 10)) })
	public Tb001Id getId() {
		return this.id;
	}

	public void setId(Tb001Id id) {
		this.id = id;
	}

	@Column(name = "XBNX", length = 2)
	public String getXbnx() {
		return this.xbnx;
	}

	public void setXbnx(String xbnx) {
		this.xbnx = xbnx;
	}

	@Column(name = "JFRQ", length = 10)
	public String getJfrq() {
		return this.jfrq;
	}

	public void setJfrq(String jfrq) {
		this.jfrq = jfrq;
	}

	@Column(name = "QBRQ", length = 10)
	public String getQbrq() {
		return this.qbrq;
	}

	public void setQbrq(String qbrq) {
		this.qbrq = qbrq;
	}

	@Column(name = "ZBRQ", length = 10)
	public String getZbrq() {
		return this.zbrq;
	}

	public void setZbrq(String zbrq) {
		this.zbrq = zbrq;
	}

	@Column(name = "CZXM", length = 100)
	public String getCzxm() {
		return this.czxm;
	}

	public void setCzxm(String czxm) {
		this.czxm = czxm;
	}

	@Column(name = "CZSFZH", length = 30)
	public String getCzsfzh() {
		return this.czsfzh;
	}

	public void setCzsfzh(String czsfzh) {
		this.czsfzh = czsfzh;
	}

	@Column(name = "CZLXFS", length = 20)
	public String getCzlxfs() {
		return this.czlxfs;
	}

	public void setCzlxfs(String czlxfs) {
		this.czlxfs = czlxfs;
	}

	@Column(name = "JBRXM", length = 100)
	public String getJbrxm() {
		return this.jbrxm;
	}

	public void setJbrxm(String jbrxm) {
		this.jbrxm = jbrxm;
	}

	@Column(name = "JBRDH", length = 20)
	public String getJbrdh() {
		return this.jbrdh;
	}

	public void setJbrdh(String jbrdh) {
		this.jbrdh = jbrdh;
	}

	@Column(name = "DW", length = 100)
	public String getDw() {
		return this.dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	@Column(name = "JB", length = 10)
	public String getJb() {
		return this.jb;
	}

	public void setJb(String jb) {
		this.jb = jb;
	}

	@Column(name = "CLLX", length = 10)
	public String getCllx() {
		return this.cllx;
	}

	public void setCllx(String cllx) {
		this.cllx = cllx;
	}

	@Column(name = "CX", length = 100)
	public String getCx() {
		return this.cx;
	}

	public void setCx(String cx) {
		this.cx = cx;
	}

	@Column(name = "CJH", length = 20)
	public String getCjh() {
		return this.cjh;
	}

	public void setCjh(String cjh) {
		this.cjh = cjh;
	}

	@Column(name = "FDJH", length = 30)
	public String getFdjh() {
		return this.fdjh;
	}

	public void setFdjh(String fdjh) {
		this.fdjh = fdjh;
	}

	@Column(name = "CPYS", length = 10)
	public String getCpys() {
		return this.cpys;
	}

	public void setCpys(String cpys) {
		this.cpys = cpys;
	}

	@Column(name = "BLLB", length = 10)
	public String getBllb() {
		return this.bllb;
	}

	public void setBllb(String bllb) {
		this.bllb = bllb;
	}

	@Column(name = "SYXZ", length = 10)
	public String getSyxz() {
		return this.syxz;
	}

	public void setSyxz(String syxz) {
		this.syxz = syxz;
	}

	@Column(name = "CDRQ", length = 10)
	public String getCdrq() {
		return this.cdrq;
	}

	public void setCdrq(String cdrq) {
		this.cdrq = cdrq;
	}

	@Column(name = "CBGS", length = 20)
	public String getCbgs() {
		return this.cbgs;
	}

	public void setCbgs(String cbgs) {
		this.cbgs = cbgs;
	}

	@Column(name = "SYXBDH", length = 50)
	public String getSyxbdh() {
		return this.syxbdh;
	}

	public void setSyxbdh(String syxbdh) {
		this.syxbdh = syxbdh;
	}

	@Column(name = "JQXBDH", length = 50)
	public String getJqxbdh() {
		return this.jqxbdh;
	}

	public void setJqxbdh(String jqxbdh) {
		this.jqxbdh = jqxbdh;
	}

	@Column(name = "CBQD", length = 20)
	public String getCbqd() {
		return this.cbqd;
	}

	public void setCbqd(String cbqd) {
		this.cbqd = cbqd;
	}

	@Column(name = "SYXSQ", length = 10)
	public String getSyxsq() {
		return this.syxsq;
	}

	public void setSyxsq(String syxsq) {
		this.syxsq = syxsq;
	}

	@Column(name = "JQXSQ", length = 10)
	public String getJqxsq() {
		return this.jqxsq;
	}

	public void setJqxsq(String jqxsq) {
		this.jqxsq = jqxsq;
	}

	@Column(name = "SYXSH", length = 10)
	public String getSyxsh() {
		return this.syxsh;
	}

	public void setSyxsh(String syxsh) {
		this.syxsh = syxsh;
	}

	@Column(name = "JQXSH", length = 10)
	public String getJqxsh() {
		return this.jqxsh;
	}

	public void setJqxsh(String jqxsh) {
		this.jqxsh = jqxsh;
	}

	@Column(name = "BFZJESH", length = 10)
	public String getBfzjesh() {
		return this.bfzjesh;
	}

	public void setBfzjesh(String bfzjesh) {
		this.bfzjesh = bfzjesh;
	}

	@Column(name = "CCS", length = 10)
	public String getCcs() {
		return this.ccs;
	}

	public void setCcs(String ccs) {
		this.ccs = ccs;
	}

	@Column(name = "HCCS", length = 10)
	public String getHccs() {
		return this.hccs;
	}

	public void setHccs(String hccs) {
		this.hccs = hccs;
	}

	@Column(name = "BHCCS", length = 10)
	public String getBhccs() {
		return this.bhccs;
	}

	public void setBhccs(String bhccs) {
		this.bhccs = bhccs;
	}

	@Column(name = "FLFBL", length = 10)
	public String getFlfbl() {
		return this.flfbl;
	}

	public void setFlfbl(String flfbl) {
		this.flfbl = flfbl;
	}

	@Column(name = "FLFFS1", length = 10)
	public String getFlffs1() {
		return this.flffs1;
	}

	public void setFlffs1(String flffs1) {
		this.flffs1 = flffs1;
	}

	@Column(name = "FLFFS2", length = 10)
	public String getFlffs2() {
		return this.flffs2;
	}

	public void setFlffs2(String flffs2) {
		this.flffs2 = flffs2;
	}

	@Column(name = "FLFFS3", length = 10)
	public String getFlffs3() {
		return this.flffs3;
	}

	public void setFlffs3(String flffs3) {
		this.flffs3 = flffs3;
	}

	@Column(name = "FLFZJE", length = 10)
	public String getFlfzje() {
		return this.flfzje;
	}

	public void setFlfzje(String flfzje) {
		this.flfzje = flfzje;
	}

	@Column(name = "SJZFBFJE", length = 10)
	public String getSjzfbfje() {
		return this.sjzfbfje;
	}

	public void setSjzfbfje(String sjzfbfje) {
		this.sjzfbfje = sjzfbfje;
	}

	@Column(name = "JSZDZRQ", length = 10)
	public String getJszdzrq() {
		return this.jszdzrq;
	}

	public void setJszdzrq(String jszdzrq) {
		this.jszdzrq = jszdzrq;
	}

	@Column(name = "CZRQ", length = 10)
	public String getCzrq() {
		return this.czrq;
	}

	public void setCzrq(String czrq) {
		this.czrq = czrq;
	}

	@Column(name = "CZR", length = 10)
	public String getCzr() {
		return this.czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
	}

	@Column(name = "STATE", length = 2)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "SJSBFJE", length = 10)
	public String getSjsbfje() {
		return this.sjsbfje;
	}

	public void setSjsbfje(String sjsbfje) {
		this.sjsbfje = sjsbfje;
	}

	@Column(name = "FLFDX", length = 2)
	public String getFlfdx() {
		return this.flfdx;
	}

	public void setFlfdx(String flfdx) {
		this.flfdx = flfdx;
	}

	@Column(name = "GH", length = 2)
	public String getGh() {
		return this.gh;
	}

	public void setGh(String gh) {
		this.gh = gh;
	}

	@Column(name = "BAK", length = 200)
	public String getBak() {
		return this.bak;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

}