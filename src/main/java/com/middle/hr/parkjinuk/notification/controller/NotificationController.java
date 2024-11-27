package com.middle.hr.parkjinuk.notification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NotificationController {

	@GetMapping("notification")
	public String getNotificatoinList() {
		return "notification/notificationList";
	}
	
	@GetMapping("notification/registration")
	public String getNotificationRegistrationForm() {
		return "notification/notificationRegistrationForm";
	}
	
	@GetMapping("notification/modification")
	public String getNotificationModificationForm() {
		return "notification/notificationModificationForm";
	}
}
