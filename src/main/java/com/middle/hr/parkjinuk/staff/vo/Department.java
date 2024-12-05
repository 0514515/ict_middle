package com.middle.hr.parkjinuk.staff.vo;

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
public class Department {
	private Long id;
	private String name;
	private Long companyId;
	private Integer totalStaffCount;
}
