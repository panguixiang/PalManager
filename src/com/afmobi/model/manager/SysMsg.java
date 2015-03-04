package com.afmobi.model.manager;

import java.util.Date;

public class SysMsg {

	private Integer msgId;
	private String title;
	private String content;
	private String imgID;
	private Date ddate;
	private String countryCodes = "";
	public Integer getMsgId() {
		return msgId;
	}
	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgID() {
		return imgID;
	}
	public void setImgID(String imgID) {
		this.imgID = imgID;
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public String getCountryCodes() {
		return countryCodes;
	}
	public void setCountryCodes(String countryCodes) {
		this.countryCodes = countryCodes;
	}
	
}
