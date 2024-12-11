package com.middle.hr.parkjinuk.common.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.middle.hr.parkjinuk.common.service.CommonService;
import com.middle.hr.parkjinuk.common.vo.Administrator;
import com.middle.hr.parkjinuk.common.vo.Company;

@Controller
@CrossOrigin(origins = "*")
public class CommonController {

	@Autowired
	CommonService commonService;

	@GetMapping("weather")
	@ResponseBody
	public ResponseEntity<String> getWeather(@RequestParam String base_date, @RequestParam String base_time,
			@RequestParam int nx, @RequestParam int ny) {
		// 외부 API URL
		String apiUrl = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstInfoService_2.0/getUltraSrtNcst"
				+ "?pageNo=1&numOfRows=1000&dataType=JSON" + "&base_date=" + base_date + "&base_time=" + base_time
				+ "&nx=" + nx + "&ny=" + ny + "&authKey=B-aqHGevT_Smqhxnr2_0eA";

		// RestTemplate을 이용하여 외부 API 호출
		RestTemplate restTemplate = new RestTemplate();
		String response = restTemplate.getForObject(apiUrl, String.class);

		return ResponseEntity.ok(response);
	}

	// 회사 목록 페이지
	@GetMapping("super/company")
	public String getCompanyList(String searchOption, String searchKeyword, Integer pageNum, Model model) {

		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "name";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;

		// 검색 옵션과 키워드로 페이지네이션 검색 (회사 검색)
		Map<String, Object> result = commonService.searchCompanyList(searchOption, searchKeyword, pageNum, 10);

		model.addAttribute("companyList", result.get("companyList")); // 회사 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "common/companyList";
	}

	// 회사 등록 페이지
	@GetMapping("super/company/new")
	public String getCompanyAddForm() {
		return "common/companyRegistrationForm";
	}

	// 회사 등록 URI
	@PostMapping("super/company/new")
	public String createCompany(Company company) {

		// 실제 회사 실행
		Integer result = commonService.createCompany(company);

		if (result == 1) {
			System.out.println("@@@ 등록 성공 @@@");
		}

		return "redirect:/super/company";
	}

	// 회사 관리자 목록 페이지
	@GetMapping("super/administrator")
	public String getCompanyAdmisitratorList(String searchOption, String searchKeyword, Integer pageNum, Model model) {

		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "name";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;

		// 검색 옵션과 키워드로 페이지네이션 검색 (관리자 검색)
		Map<String, Object> result = commonService.searchCompanyAdministratorList(searchOption, searchKeyword, pageNum,
				10);

		model.addAttribute("administratorList", result.get("administratorList")); // 회사 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "common/companyAdministratorList";
	}

	// 회사 관리자 등록 페이지
	@GetMapping("super/administrator/new")
	public String getCompanyAdministratorAddForm() {
		return "common/companyAdministratorRegistrationForm";
	}

	// 관리자 등록 URI
	@PostMapping("super/administrator/new")
	public String createCompanyAdministrator(Administrator administrator) {

		System.out.println(administrator);

		// 실제 회사 실행
		Integer result = commonService.createCompanyAdministrator(administrator);

		if (result == 1) {
			System.out.println("@@@ 등록 성공 @@@");
		}

		return "redirect:/super/administrator";
	}
}