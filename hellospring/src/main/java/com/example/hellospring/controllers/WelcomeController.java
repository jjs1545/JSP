package com.example.hellospring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.hellospring.vo.RequestVo;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {
	@RequestMapping("/")
	/*public ModelAndView home(@RequestParam("name") String name) {*/
	public ModelAndView home(@RequestParam(value="name",
											required=false,
											defaultValue="There")
										String name){
		ModelAndView mav = new ModelAndView();
		mav.addObject("message","Hello, " +name);
		
		mav.setViewName("/WEB-INF/views/hello.jsp");
		return mav;
	}
	
	// Path Variable 사용
	@RequestMapping("/pathparams/{name}/{no}")
	public ModelAndView pathParams(@PathVariable("name") String name,
									@PathVariable("no")	Long no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Name:" + name + ", NO:" +no);
		mav.setViewName("/WEB-INF/views/hello.jsp");
		
		return mav;
	}
	
	
	// 요청 파라미터를 객체에 담아 전달
	@RequestMapping("/using-vo")
	public ModelAndView usingVo(@ModelAttribute RequestVo reqVo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Name" + reqVo.getName() +
				", NO:" + reqVo.getNo());
		mav.setViewName("/WEB-INF/views/hello.jsp");
		
		return mav;
	}
	
	// Return String -> view Name을 리턴
	@RequestMapping("/rstring")
	public String returnString() {
		return "/WEB-INF/views/hello.jsp";		//View Name을 리턴
	}
	
	// Return String, Model(ModelMap)을 주면 뷰에 객체 전달 가능
	@RequestMapping("rstring2")
	public String returnString2(ModelMap map) {
		map.addAttribute("message","rstring2");
		
		return "/WEB-INF/views/hello.jsp";
	}
	
	// Return Response Body
	@RequestMapping("/resbody")
	@ResponseBody
	public String resBody() {
		return "Response Body";
	}
}
