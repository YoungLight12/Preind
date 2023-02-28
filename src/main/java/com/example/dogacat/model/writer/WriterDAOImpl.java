package com.example.dogacat.model.writer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WriterDAOImpl implements WriterDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<WriterDTO> list(int start, int end, String search_option, String keyword, int address) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("address", address);

		return sqlSession.selectList("writer.list", map);
	}

	@Override
	public int insert(WriterDTO dto) {
		sqlSession.insert("writer.insert", dto);
		
		return sqlSession.selectOne("writer.findwrite_code", dto.getId());
	}

	@Override
	public WriterDTO detail(int write_code) {
		return sqlSession.selectOne("writer.view", write_code);
	}

	@Override
	public void update(WriterDTO dto) {
		sqlSession.update("writer.update", dto);
	}

	@Override
	public void delete(int idx) {
		sqlSession.delete("writer.delete", idx);
	}

	@Override
	public int count(String search_option, String keyword, int address) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("address", address);

		return sqlSession.selectOne("writer.count", map);
	}

	@Override
	public void hit(int write_code) {
		sqlSession.update("writer.hit", write_code);
	}

	@Override
	public void insert(WriteFileDTO dto) {
		sqlSession.insert("writer.insertfile", dto);
	}

	@Override
	public List<String> filename(int write_code) {
		return sqlSession.selectList("writer.filename", write_code);
	}

	@Override
	public void dropfile(int write_code) {
		sqlSession.delete("writer.dropfile", write_code);
	}
}
