package com.middle.hr.parkjinuk.common.controller.dto;

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
public class CompanyDTO {

	private String id;
	private String name;
	private String address;
	private String phoneNumber;
	private String foundedDate;
}
