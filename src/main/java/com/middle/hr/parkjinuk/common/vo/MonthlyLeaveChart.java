package com.middle.hr.parkjinuk.common.vo;

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
public class MonthlyLeaveChart {
	String month;
	String rate;
}
