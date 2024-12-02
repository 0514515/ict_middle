package com.middle.hr.parkjinuk.common.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middle.hr.parkjinuk.common.controller.vo.Administrator;
import com.middle.hr.parkjinuk.common.controller.vo.Company;

@Controller
public class CommonController {

	//회사 목록 페이지
	@GetMapping("super/company")
	public String getCompanyList() {
		return "common/companyList";
	}
	
	//회사 등록 페이지
	@GetMapping("super/company/new")
	public String getCompanyAddForm() {
		return "common/companyRegistrationForm";
	}
	
	//회사 관리자 목록 페이지
	@GetMapping("super/administrator")
	public String getCompanyAdmisitratorList() {
		return "common/companyAdministratorList";
	}
	
	//회사 관리자 등록 페이지
	@GetMapping("super/administrator/new")
	public String getCompanyAdministratorAddForm() {
		return "common/companyAdministratorRegistrationForm";
	}
	
	//회사 등록 URI
	@PostMapping("super/company/new")
	public String createCompany(Company company) {
		
		/**
		 * To Do
		 * 
		 * 회사를 추가하는 서비스 로직 실행
		 */
		
		System.out.println(company);
		
		return "redirect:/super/company";
	}
	
	//검색 옵션과 검색 키워드로 회사 리스트 검색하기
	@GetMapping("super/company/list")
	@ResponseBody
	public List<Company> getCompanyListBySearchOptionAndSearchKeyword(String searchOption, String searchKeyword) {
		
		/**
		 *  To-Do
		 * 
		 * 	검색 옵션과 검색 키워드를 바탕으로 검색 Service 메소드 호출
		 */
		
		List<Company> result = new ArrayList<>();
		
		//임시 데이터 반환용
		for(int i=1;i<=10;i++) {
			result.add(
					new Company(
							i+"",
							"회사"+i
							,"주소"+i
							,"전화번호"+i
							,"2020-01-01"
							)
					);
		}
		
		return result;
	}
	
	//검색 옵션과 검색 키워드로 관리자 리스트 검색하기
	@GetMapping("super/administrator/list")
	@ResponseBody
	public List<Administrator> getAdministratorListBySearchOptionAndSearchKeyword(String searchOption, String searchKeyword){
		
		/**
		 *  To-Do
		 * 
		 * 	검색 옵션과 검색 키워드를 바탕으로 검색 Service 메소드 호출
		 */
		
		List<Administrator> result = new ArrayList<>();
		
		return result;
	}
}