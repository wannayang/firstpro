package com.ygcx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Tb001b entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb001b"
    ,catalog="ygcx"
)

public class Tb001b  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -1164959000673109726L;
	private Integer id;
     private String syxbdh;
     private String xzmc;
     private String bxje;


    // Constructors

    /** default constructor */
    public Tb001b() {
    }

    
    /** full constructor */
    public Tb001b(String syxbdh, String xzmc, String bxje) {
        this.syxbdh = syxbdh;
        this.xzmc = xzmc;
        this.bxje = bxje;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="ID", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="SYXBDH", length=50)

    public String getSyxbdh() {
        return this.syxbdh;
    }
    
    public void setSyxbdh(String syxbdh) {
        this.syxbdh = syxbdh;
    }
    
    @Column(name="XZMC", length=50)

    public String getXzmc() {
        return this.xzmc;
    }
    
    public void setXzmc(String xzmc) {
        this.xzmc = xzmc;
    }
    
    @Column(name="BXJE", length=10)

    public String getBxje() {
        return this.bxje;
    }
    
    public void setBxje(String bxje) {
        this.bxje = bxje;
    }
   








}