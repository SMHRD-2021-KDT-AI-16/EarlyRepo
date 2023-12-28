package com.early.model;

public class SearchApartVO {
	private int apart_seq;
	private String apt_name;
	private String apt_loc;
	private int apt_realprice;
	
	public int getApart_seq() {
		return apart_seq;
	}
	public void setApart_seq(int apart_seq) {
		this.apart_seq = apart_seq;
	}
	public String getApt_name() {
		return apt_name;
	}
	public void setApt_name(String apt_name) {
		this.apt_name = apt_name;
	}
	public String getApt_loc() {
		return apt_loc;
	}
	public void setApt_loc(String apt_loc) {
		this.apt_loc = apt_loc;
	}
	public int getApt_realprice() {
		return apt_realprice;
	}
	public void setApt_realprice(int apt_realprice) {
		this.apt_realprice = apt_realprice;
	}
}
