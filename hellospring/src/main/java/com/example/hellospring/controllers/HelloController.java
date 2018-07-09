package com.example.hellospring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller //해당 컨트롤러로 인식
public class HelloController {
	@RequestMapping("/hello") // 경로를 /hello로 설정 시 결과 출력
	public ModelAndView hello(@RequestParam("name")String name) { //특정 데이타와 뷰(모델)를 한번에 담아놓은 객체
		ModelAndView mav = new ModelAndView(); // 순서1. 객체 생성
		
		mav.addObject("message", "Hello, " + name); //JSP 단으로 넘길 데이터
		mav.setViewName("/WEB-INF/views/hello.jsp"); //해당 경로에 hello.jsp파일로 반환
		
		return mav;
	}
}