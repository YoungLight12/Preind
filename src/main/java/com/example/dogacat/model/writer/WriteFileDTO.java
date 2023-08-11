package com.example.dogacat.model.writer;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WriteFileDTO {
	private String filename;
	private int write_code;
}
