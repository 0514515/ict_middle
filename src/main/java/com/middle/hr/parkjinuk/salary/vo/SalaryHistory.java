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
	private Long totalAmount;
	private String specifiedAt;
	private Long companyId;
	private Long staffId;
	private Integer basicSalaryAmount;
	private List<DetailCommission> detailCommissions;
}
