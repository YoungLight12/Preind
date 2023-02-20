package com.example.dogacat.model.writer;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyDTO {
	private int idx;
	private int write_code;
	private String reply_text;
	private String nickname;
	private String id;
	private Date date;
}
