package com.middle.hr.parksuji;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AController {
	
	@GetMapping("a")
	public String test() {
		return "page";
	}
}
