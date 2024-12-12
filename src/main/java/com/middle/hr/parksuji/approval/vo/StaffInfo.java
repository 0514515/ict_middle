package com.middle.hr.parksuji.approval.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StaffInfo {
	private String name;
	private String departmentName; 
	private String rank; 
	private String id; // Staff 사원번호 
	
}
