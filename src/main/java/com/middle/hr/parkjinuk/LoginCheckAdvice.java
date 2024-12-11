package com.middle.hr.parkjinuk;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Aspect
@Component
public class LoginCheckAdvice {
	
	@Autowired
	StaffService staffService;
	
	@Around("execution(* com.middle.hr.*.*.controller.*.*(..))")
	//로그인 검사 AOP
	public Object sessionCheck(ProceedingJoinPoint point) throws Throwable{
		
		String methodName = point.getSignature().getName();
		String classPath = point.getSignature().getDeclaringTypeName();
		String className = classPath.substring(classPath.lastIndexOf('.')+1);
		
		System.out.println("[*************** 호출한 클래스 >>>>> " + className);
		System.out.println("[*************** 호출한 메소드 >>>>> " + methodName);
		
		//세션을 얻기 위해 로그인 메소드를 실행해야하므로 로그인 메소드는 세션 검사 제외
		if(methodName.equals("login")) {
			return point.proceed();
		}
		
		//세션 받아오기
		HttpSession currentSession = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		
		//세션의 로그인 아이디 받아오기
		//나중에 특정 메소드 제외로 바꿔야함
		String loginId = (String)(currentSession.getAttribute("loginId"));
		
		System.out.println(loginId);
		
		Staff staff = staffService.searchStaffInformationByLoginId(loginId);
		
		// 네트워크 공유 폴더에서 이미지 파일 읽기
		if (staff.getPicture() != null) {
			staff.setPicture(readImageFromNetworkShare(staff.getPicture()));
		}

		if (staff.getSign() != null) {
			staff.setSign(readImageFromNetworkShare(staff.getSign()));
		}
		
		//세션 없으면 null이므로 로그인 창으로 리다이렉트
		if(staff==null) {
			System.out.println("[*************** 세션 없음");
			return "redirect:/index.jsp";
		}
		
		System.out.println("[*************** 세션 있음");
		
	    // 실행 대상 메서드의 매개변수 수정
	    Object[] args = point.getArgs();
	    for (int i = 0; i < args.length; i++) {
	        if (args[i] instanceof Model) {
	            Model model = (Model) args[i];
	            model.addAttribute("menuStaff", staff); // Model에 staff 추가
	        }
	    }
		
		return point.proceed(args);
	}
	
	// 이미지 파일을 Base64로 읽어오기
	public String readImageFromNetworkShare(String filePath) throws IOException {
		File file = new File(filePath);
		if (!file.exists()) {
			return "";
		}

		try (FileInputStream fis = new FileInputStream(file)) {
			byte[] bytes = fis.readAllBytes();
			return "data:image/png;base64," + Base64.getEncoder().encodeToString(bytes);
		}
	}
}
