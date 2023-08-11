package com.example.dogacat.model.writer;

import java.util.List;


public interface WriterDAO {
	List<WriterDTO> list(int start, int end, String search_option, String keyword, int address);

	void insert(WriterDTO dto);

	WriterDTO detail(int write_code);

	void hit(int write_code);

	void update(WriterDTO dto);

	void delete(int idx);
	
	//게시물 수
	int count(String search_option, String keyword, int address);	

	//첨부파일 관련
	List<String> list_attach(int idx);

	void insert_attach(String file_name);		

	void update_attach(String file_name, int idx);

	void delete_attach(String file_name);
}
