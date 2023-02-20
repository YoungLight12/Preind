package com.example.dogacat.model.writer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<ReplyDTO> list(int start, int end, int write_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("write_code", write_code);
		
		return session.selectList("reply.list", map);
	}

	@Override
	public void insert(ReplyDTO dto) {
		session.insert("reply.insert", dto);
	}

	@Override
	public void delete(int idx) {	
		session.delete("reply.delete", idx);
	}

	@Override
	public void pagedelete(int write_code) {
		session.delete("reply.pagedelete", write_code);
	}

	@Override
	public int count(int write_code) {
		return session.selectOne("reply.count", write_code);
	}

	@Override
	public ReplyDTO detail(int idx) {
		return session.selectOne("reply.detail", idx);
	}

	@Override
	public void update(int idx, String reply_text) {
		Map<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("reply_text", reply_text);
		
		session.update("reply.update", map);
	}
}
