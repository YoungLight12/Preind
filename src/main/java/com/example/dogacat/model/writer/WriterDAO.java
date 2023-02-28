package com.example.dogacat.model.writer;

import java.util.List;


public interface WriterDAO {
	List<WriterDTO> list(int start, int end, String search_option, String keyword, int address);

	int insert(WriterDTO dto);

	WriterDTO detail(int write_code);

	void hit(int write_code);

	void update(WriterDTO dto);

	void delete(int idx);
	
	//게시물 수
	int count(String search_option, String keyword, int address);	
	
	void insert(WriteFileDTO dto);
	
	List<String> filename(int write_code);
	
	void dropfile(int write_code);
}
