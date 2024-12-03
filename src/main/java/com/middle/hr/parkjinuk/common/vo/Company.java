package com.middle.hr.parkjinuk.common.vo;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Company {
	private String id;
	private String name;
	private String address;
	private String phoneNumber;
	private String foundedAt;
}
