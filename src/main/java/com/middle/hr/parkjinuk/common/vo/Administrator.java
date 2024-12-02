package com.middle.hr.parkjinuk.common.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class Administrator {
	private String staffId;
	private String companyId;
	private String companyName;
	private String staffName;
	private String createdAt;
}
