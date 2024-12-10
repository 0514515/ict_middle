package com.middle.hr.parkjinuk.salary.vo;

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
public class SalaryHistory {
	private Long id;
	private String name;
	private String totalAmount;
	private String specifiedAt;
	private Long companyId;
	private Long staffId;
	private String basicSalaryAmount;
	private List<DetailCommission> detailCommissions;
}
