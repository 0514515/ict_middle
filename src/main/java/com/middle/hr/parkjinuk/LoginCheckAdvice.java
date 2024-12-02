package com.middle.hr.parkjinuk;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class LoginCheckAdvice {
	
	@Around("execution(* com.middle.hr.parkjinuk.*.controller.*.*(..))")
	public Object sessionCheck(ProceedingJoinPoint point) throws Throwable{
		
		String methodName = point.getSignature().getName();
		System.out.println("[*************** 공통관심사 사전작업 >>>>> " + methodName);
		
		//세션을 얻기 위해 로그인 메소드를 실행해야하므로 로그인 메소드는 세션 검사 제외
		if(methodName.equals("login")) {
			return point.proceed();
		}
		
		HttpSession currentSession = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		
		//세션의 로그인 아이디 받아오기
		//나중에 특정 메소드 제외로 바꿔야함
		String loginId = (String)(currentSession.getAttribute("loginId"));
		
		//세션 없으면 null이므로 로그인 창으로 리다이렉트
		if(loginId==null || loginId.isBlank()) {
			System.out.println("[*************** 세션 없음");
			return "redirect:/index.jsp";
		}
		
		System.out.println("[*************** 세션 있음");
		
		return point.proceed();
	}
}
