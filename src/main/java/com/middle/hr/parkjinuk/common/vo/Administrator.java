package com.middle.hr.parkjinuk.common.vo;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Administrator {
	private Long staffId;
	private Long companyId;
	private String companyName;
	private String staffName;
	private String createdAt;
	private String loginId;
	private String password;
	private String phoneNumber;
	private String email;
}
