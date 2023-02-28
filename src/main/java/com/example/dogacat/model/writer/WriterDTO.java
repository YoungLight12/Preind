package com.example.dogacat.model.writer;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WriterDTO {
	private int write_code;
	private String id;
	private int pet_code;
	private String title;
	private String text;
	private int filecount;
	private Date date;
	private int hit;
	private int address;
	private String nickname;
}
