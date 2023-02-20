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
	public void insert(WriterDTO dto) {
		sqlSession.insert("writer.insert", dto);
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
	public List<String> list_attach(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert_attach(String file_name) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update_attach(String file_name, int idx) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete_attach(String file_name) {
		// TODO Auto-generated method stub

	}

	@Override
	public void hit(int write_code) {
		sqlSession.update("writer.hit", write_code);
	}
}
