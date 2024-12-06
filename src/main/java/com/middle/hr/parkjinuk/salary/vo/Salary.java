package com.middle.hr.parkjinuk.salary.vo;

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
public class Salary {
	
	private Long id;
	private String name;
	private String amount;
	private String companyId;
}
