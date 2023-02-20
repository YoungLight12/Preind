package com.example.dogacat.model.writer;

import java.util.List;

public interface ReplyDAO {
	List<ReplyDTO> list(int start, int end, int write_code);
	
	void insert(ReplyDTO dto);
	
	void delete(int idx);
	
	void update(int idx, String reply_text);
	
	void pagedelete(int write_code);
	
	int count(int write_code);
	
	ReplyDTO detail(int idx);
}
