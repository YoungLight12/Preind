package com.example.dogacat.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberDTO login(MemberDTO dto) {
		return sqlSession.selectOne("member.login", dto);
	}

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update("member.update", dto);
	}

	@Override
	public void delete(String id) {
		sqlSession.delete("member.delete", id);
		sqlSession.delete("pet.deleteAll", id);
	}

	@Override
	public int checkid(String id) {
		return sqlSession.selectOne("member.checkid", id);
	}

	@Override
	public int checkpw(String id, String pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectOne("member.checkpw", map);
	}

	@Override
	public String find_id(String name, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);

		return sqlSession.selectOne("member.find_id", map);

	}

	@Override
	public MemberDTO info(String id) {
		return sqlSession.selectOne("member.info", id);
	}

	@Override
	public List<String> addresslist() {
		return sqlSession.selectList("member.addresslist");
	}

	@Override
	public List<MemberDTO> list() {
		return sqlSession.selectList("member.list");
	}

	@Override
	public String find_pw(String id, String name, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		return sqlSession.selectOne("member.find_pw", map);
	}
}
