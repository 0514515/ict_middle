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
public class StaffCommission {
	private Long commissionId;
	private String commissionName;
	private Long staffId;
	private String staffName;
	private Integer checkDefaultAmount;
	private Integer amount;
}
