package com.middle.hr.parkjinuk.member.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class LoginFormDTO {
	private final String loginId;
	private final String password;
}