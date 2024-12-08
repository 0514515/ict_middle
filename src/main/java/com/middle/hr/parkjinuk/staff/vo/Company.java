package com.middle.hr.parkjinuk.staff.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Company {
	private Long id;
	private String name;
	private String address;
	private String phoneNumber;
	private String foundedAt;
	private List<Department> departments;
	
	public List<Department> getDepartments() {
	    return departments;
	}
}
