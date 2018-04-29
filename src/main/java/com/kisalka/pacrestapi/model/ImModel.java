package com.kisalka.pacrestapi.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="imaginary")
public class ImModel implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String pname;
	private String devname;
	private String Pdate;
	private Long hrs;
	private Long ot;
	private String des;
	
	public ImModel(){}
	
	public ImModel(String pname, String devname, String pdate, Long hrs, Long ot, String des) {
		super();
		this.pname = pname;
		this.devname = devname;
		Pdate = pdate;
		this.hrs = hrs;
		this.ot = ot;
		this.des = des;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getDevname() {
		return devname;
	}

	public void setDevname(String devname) {
		this.devname = devname;
	}

	public String getPdate() {
		return Pdate;
	}

	public void setPdate(String pdate) {
		Pdate = pdate;
	}

	public Long getHrs() {
		return hrs;
	}

	public void setHrs(Long hrs) {
		this.hrs = hrs;
	}

	public Long getOt() {
		return ot;
	}

	public void setOt(Long ot) {
		this.ot = ot;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	@Override
	public String toString() {
		return "ImModel [id=" + id + ", pname=" + pname + ", devname=" + devname + ", Pdate=" + Pdate + ", hrs=" + hrs
				+ ", ot=" + ot + ", des=" + des + "]";
	}

}
