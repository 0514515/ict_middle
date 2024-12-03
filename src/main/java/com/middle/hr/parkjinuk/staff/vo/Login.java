package com.middle.hr.parkjinuk.staff.vo;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Login {
	private String loginId;
	private String password;
}