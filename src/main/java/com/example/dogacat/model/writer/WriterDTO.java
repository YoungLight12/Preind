package com.example.dogacat.model.writer;

import java.sql.Date;

public class WriterDTO {
	private int write_code;
	private String id;
	private int pet_code;
	private String title;
	private String text;
	private String filename;
	private Date date;
	private int hit;
	private int address;
	private String nickname;

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getWrite_code() {
		return write_code;
	}

	public void setWrite_code(int write_code) {
		this.write_code = write_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPet_code() {
		return pet_code;
	}

	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAddress() {
		return address;
	}

	public void setAddress(int address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "WriterDTO [write_code=" + write_code + ", id=" + id + ", pet_code=" + pet_code + ", title=" + title
				+ ", text=" + text + ", filename=" + filename + ", date=" + date + ", hit=" + hit + ", address="
				+ address + ", nickname=" + nickname + "]";
	}
}
