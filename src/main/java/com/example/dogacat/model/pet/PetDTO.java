package com.example.dogacat.model.pet;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PetDTO {
	private int pet_code;
	private String id;
	private int pet_type;
	private String pet_name;
	private int size;
	private boolean gender;
	private Date birth;
	private int weight;
	private boolean peanut;
	private int bark;
	private int bite;
	private String type_name;
	private String filename;
	private MultipartFile file1;

	public int getPet_code() {
		return pet_code;
	}

	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public boolean getPeanut() {
		return peanut;
	}

	public void setPeanut(boolean peanut) {
		this.peanut = peanut;
	}

	public int getBark() {
		return bark;
	}

	public void setBark(int bark) {
		this.bark = bark;
	}

	public int getBite() {
		return bite;
	}

	public void setBite(int bite) {
		this.bite = bite;
	}

	public int getPet_type() {
		return pet_type;
	}

	public void setPet_type(int pet_type) {
		this.pet_type = pet_type;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	@Override
	public String toString() {
		return "PetDTO [pet_code=" + pet_code + ", id=" + id + ", pet_type=" + pet_type + ", pet_name=" + pet_name
				+ ", size=" + size + ", gender=" + gender + ", birth=" + birth + ", weight=" + weight + ", peanut="
				+ peanut + ", bark=" + bark + ", bite=" + bite + ", type_name=" + type_name + ", filename=" + filename
				+ ", file1=" + file1 + "]";
	}

}
