package com.ygcx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Tb001t entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb001t"
    ,catalog="ygcx"
)

public class Tb001t  implements java.io.Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = 7970386303407822168L;
	// Fields    

     private Integer id;
     private String cph;
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
     private String cdrq;
     private String cbgs;
     private String syxbdh;
     private String jqxbdh;
     private String cbqd;
     private String syx;
     private String jqx;
     private String ccs;
     private String hccs;
     private String bhccs;
     private String zffs;
     private String zfsjje;
     private String flffs;
     private String flfje;
     private String tbnf;
     private String czrq;
     private String jszdzrq;


    // Constructors

    /** default constructor */
    public Tb001t() {
    }

	/** minimal constructor */
    public Tb001t(String cph) {
        this.cph = cph;
    }
    
    /** full constructor */
    public Tb001t(String cph, String xbnx, String jfrq, String qbrq, String zbrq, String czxm, String czsfzh, String czlxfs, String jbrxm, String jbrdh, String dw, String jb, String cllx, String cx, String cjh, String fdjh, String cdrq, String cbgs, String syxbdh, String jqxbdh, String cbqd, String syx, String jqx, String ccs, String hccs, String bhccs, String zffs, String zfsjje, String flffs, String flfje, String tbnf, String czrq, String jszdzrq) {
        this.cph = cph;
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
        this.cdrq = cdrq;
        this.cbgs = cbgs;
        this.syxbdh = syxbdh;
        this.jqxbdh = jqxbdh;
        this.cbqd = cbqd;
        this.syx = syx;
        this.jqx = jqx;
        this.ccs = ccs;
        this.hccs = hccs;
        this.bhccs = bhccs;
        this.zffs = zffs;
        this.zfsjje = zfsjje;
        this.flffs = flffs;
        this.flfje = flfje;
        this.tbnf = tbnf;
        this.czrq = czrq;
        this.jszdzrq = jszdzrq;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="CPH", nullable=false, length=8)

    public String getCph() {
        return this.cph;
    }
    
    public void setCph(String cph) {
        this.cph = cph;
    }
    
    @Column(name="XBNX", length=2)

    public String getXbnx() {
        return this.xbnx;
    }
    
    public void setXbnx(String xbnx) {
        this.xbnx = xbnx;
    }
    
    @Column(name="JFRQ", length=10)

    public String getJfrq() {
        return this.jfrq;
    }
    
    public void setJfrq(String jfrq) {
        this.jfrq = jfrq;
    }
    
    @Column(name="QBRQ", length=10)

    public String getQbrq() {
        return this.qbrq;
    }
    
    public void setQbrq(String qbrq) {
        this.qbrq = qbrq;
    }
    
    @Column(name="ZBRQ", length=10)

    public String getZbrq() {
        return this.zbrq;
    }
    
    public void setZbrq(String zbrq) {
        this.zbrq = zbrq;
    }
    
    @Column(name="CZXM", length=100)

    public String getCzxm() {
        return this.czxm;
    }
    
    public void setCzxm(String czxm) {
        this.czxm = czxm;
    }
    
    @Column(name="CZSFZH", length=30)

    public String getCzsfzh() {
        return this.czsfzh;
    }
    
    public void setCzsfzh(String czsfzh) {
        this.czsfzh = czsfzh;
    }
    
    @Column(name="CZLXFS", length=20)

    public String getCzlxfs() {
        return this.czlxfs;
    }
    
    public void setCzlxfs(String czlxfs) {
        this.czlxfs = czlxfs;
    }
    
    @Column(name="JBRXM", length=100)

    public String getJbrxm() {
        return this.jbrxm;
    }
    
    public void setJbrxm(String jbrxm) {
        this.jbrxm = jbrxm;
    }
    
    @Column(name="JBRDH", length=20)

    public String getJbrdh() {
        return this.jbrdh;
    }
    
    public void setJbrdh(String jbrdh) {
        this.jbrdh = jbrdh;
    }
    
    @Column(name="DW", length=100)

    public String getDw() {
        return this.dw;
    }
    
    public void setDw(String dw) {
        this.dw = dw;
    }
    
    @Column(name="JB", length=10)

    public String getJb() {
        return this.jb;
    }
    
    public void setJb(String jb) {
        this.jb = jb;
    }
    
    @Column(name="CLLX", length=10)

    public String getCllx() {
        return this.cllx;
    }
    
    public void setCllx(String cllx) {
        this.cllx = cllx;
    }
    
    @Column(name="CX", length=100)

    public String getCx() {
        return this.cx;
    }
    
    public void setCx(String cx) {
        this.cx = cx;
    }
    
    @Column(name="CJH", length=20)

    public String getCjh() {
        return this.cjh;
    }
    
    public void setCjh(String cjh) {
        this.cjh = cjh;
    }
    
    @Column(name="FDJH", length=30)

    public String getFdjh() {
        return this.fdjh;
    }
    
    public void setFdjh(String fdjh) {
        this.fdjh = fdjh;
    }
    
    @Column(name="CDRQ", length=10)

    public String getCdrq() {
        return this.cdrq;
    }
    
    public void setCdrq(String cdrq) {
        this.cdrq = cdrq;
    }
    
    @Column(name="CBGS", length=20)

    public String getCbgs() {
        return this.cbgs;
    }
    
    public void setCbgs(String cbgs) {
        this.cbgs = cbgs;
    }
    
    @Column(name="SYXBDH", length=50)

    public String getSyxbdh() {
        return this.syxbdh;
    }
    
    public void setSyxbdh(String syxbdh) {
        this.syxbdh = syxbdh;
    }
    
    @Column(name="JQXBDH", length=50)

    public String getJqxbdh() {
        return this.jqxbdh;
    }
    
    public void setJqxbdh(String jqxbdh) {
        this.jqxbdh = jqxbdh;
    }
    
    @Column(name="CBQD", length=20)

    public String getCbqd() {
        return this.cbqd;
    }
    
    public void setCbqd(String cbqd) {
        this.cbqd = cbqd;
    }
    
    @Column(name="SYX", length=10)

    public String getSyx() {
        return this.syx;
    }
    
    public void setSyx(String syx) {
        this.syx = syx;
    }
    
    @Column(name="JQX", length=10)

    public String getJqx() {
        return this.jqx;
    }
    
    public void setJqx(String jqx) {
        this.jqx = jqx;
    }
    
    @Column(name="CCS", length=10)

    public String getCcs() {
        return this.ccs;
    }
    
    public void setCcs(String ccs) {
        this.ccs = ccs;
    }
    
    @Column(name="HCCS", length=10)

    public String getHccs() {
        return this.hccs;
    }
    
    public void setHccs(String hccs) {
        this.hccs = hccs;
    }
    
    @Column(name="BHCCS", length=10)

    public String getBhccs() {
        return this.bhccs;
    }
    
    public void setBhccs(String bhccs) {
        this.bhccs = bhccs;
    }
    
    @Column(name="ZFFS", length=10)

    public String getZffs() {
        return this.zffs;
    }
    
    public void setZffs(String zffs) {
        this.zffs = zffs;
    }
    
    @Column(name="ZFSJJE", length=10)

    public String getZfsjje() {
        return this.zfsjje;
    }
    
    public void setZfsjje(String zfsjje) {
        this.zfsjje = zfsjje;
    }
    
    @Column(name="FLFFS", length=50)

    public String getFlffs() {
        return this.flffs;
    }
    
    public void setFlffs(String flffs) {
        this.flffs = flffs;
    }
    
    @Column(name="FLFJE", length=10)

    public String getFlfje() {
        return this.flfje;
    }
    
    public void setFlfje(String flfje) {
        this.flfje = flfje;
    }
    
    @Column(name="TBNF", length=10)

    public String getTbnf() {
        return this.tbnf;
    }
    
    public void setTbnf(String tbnf) {
        this.tbnf = tbnf;
    }
    
    @Column(name="CZRQ", length=10)

    public String getCzrq() {
        return this.czrq;
    }
    
    public void setCzrq(String czrq) {
        this.czrq = czrq;
    }
    
    @Column(name="JSZDZRQ", length=10)

    public String getJszdzrq() {
        return this.jszdzrq;
    }
    
    public void setJszdzrq(String jszdzrq) {
        this.jszdzrq = jszdzrq;
    }
   








}