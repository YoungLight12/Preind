package com.example.dogacat.model.pet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetDAOImpl implements PetDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insert(PetDTO dto) {
		sqlSession.insert("pet.insert",dto);
	}

	@Override
	public void update(PetDTO dto) {
		sqlSession.update("pet.update",dto);
	}

	@Override
	public void delete(int pet_code) {
		sqlSession.delete("pet.delete",pet_code);
	}

	@Override
	public List<PetDTO> list(String id, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("pet.list", map);
	}

	@Override
	public PetDTO view(int pet_code) {
		return sqlSession.selectOne("pet.view",pet_code);
	}

	@Override
	public String type_name(int pet_code) {
		return sqlSession.selectOne("pet.type_name",pet_code);
	}

	@Override
	public String find_master(String id) {
		return sqlSession.selectOne("pet.find_master",id);
	}

	@Override
	public PetDTO up(int pet_code) {
		return sqlSession.selectOne("pet.up",pet_code);
	}

	@Override
	public PetDTO down(int pet_code) {
		return sqlSession.selectOne("pet.down",pet_code);
	}
	
	@Override
	public List<String> pet_filename(String id) {
		return sqlSession.selectList("pet.pet_filename", id);
	}

	@Override
	public int count(String id) {
		return sqlSession.selectOne("pet.count", id);
	}

	@Override
	public List<PetDTO> all() {
		return sqlSession.selectList("pet.all");
	}

}
