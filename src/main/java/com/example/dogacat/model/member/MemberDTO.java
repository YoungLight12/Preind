package com.example.dogacat.model.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String post_code;
	private String address1;
	private String address2;
	private int lv;
	private double grade;
	private double lng;
	private double lat;
}
