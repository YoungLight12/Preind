package com.example.dogacat.model.member;

import java.util.List;

public interface MemberDAO {
	MemberDTO login(MemberDTO dto);

	void insert(MemberDTO dto);

	void update(MemberDTO dto);

	void delete(String id);

	int checkid(String id);
	
	int checkpw(String id, String pw);
	
	String find_id(String name,String email);
	
	String find_pw(String id, String name,String email);
	
	MemberDTO info(String id);
	
	List<String> addresslist();
	
	List<MemberDTO> list();
}
