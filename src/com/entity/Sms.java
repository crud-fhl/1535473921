package com.entity;

import org.springframework.stereotype.Component;

@Component
public class Sms {
	public Sms() {
		super();
		// TODO Auto-generated constructor stub
	}
	private Integer id;
	private String username;
	private String sender;
	private String message;
	private String sendtime;
	private String isRead;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getIsRead() {
		return isRead;
	}
	public Sms(Integer id, String username, String sender, String message,
			String sendtime, String isRead) {
		super();
		this.id = id;
		this.username = username;
		this.sender = sender;
		this.message = message;
		this.sendtime = sendtime;
		this.isRead = isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
}
