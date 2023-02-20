package com.example.dogacat.model.pet;

import java.util.List;

public interface PetDAO {
	void insert(PetDTO dto);
	
	void update(PetDTO dto);
	
	void delete(int pet_code);
	
	List<PetDTO> list(String id, int start, int end);
	
	int count(String id);

	PetDTO view(int pet_code);
	
	String type_name(int pet_type);
	
	String find_master(String id);
	
	PetDTO up(int pet_code);
	
	PetDTO down(int pet_code);
	
	List<PetDTO> pet_filename();
}
