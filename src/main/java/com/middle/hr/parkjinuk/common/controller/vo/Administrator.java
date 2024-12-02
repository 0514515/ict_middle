package com.middle.hr.parkjinuk.common.controller.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class Administrator {
	private String companyId;
	private String name;
	private String loginId;
	private String password;
	private String phoneNumber;
	private String email;
}
