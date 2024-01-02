package com.early.model;

public class NoticeBoardVO {
	private int f_seq;
	private String f_content;
	private String f_file;
	private String created_at;
	private int f_views;
	private int f_likes;
	private String user_id;
	private String loc;
	private String user_nick;
	
	
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public String getF_file() {
		return f_file;
	}
	public void setF_file(String f_file) {
		this.f_file = f_file;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public int getF_views() {
		return f_views;
	}
	public void setF_views(int f_views) {
		this.f_views = f_views;
	}
	public int getF_likes() {
		return f_likes;
	}
	public void setF_likes(int f_likes) {
		this.f_likes = f_likes;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
}
