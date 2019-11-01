package com.mycompany.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.web.service.LoginResult;
import com.mycompany.web.service.LoginService;

@Controller
//@RequestMapping("/loginpage")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/goToJoinPage")
	public String goToJoinPage() {
		
		return "joinFormPage";
		
	}
	
	
//	@RequestMapping("/loginPage01")
//	public String loginPage01() {
//		
//		
//		return "loginpage/loginPage01";
//		
//	}
	
	
	@RequestMapping("loginpage/loginPage01")
	public String loginPage01(String error, Model model) {
		
		if (error != null) {
			
			if (error.equals("fail_mid")) {
				
				model.addAttribute("midError", "아이디가 존재하지 않습니다");
			} else if (error.equals("fail_mpassword")) {
				
				model.addAttribute("mpasswordError", "비밀번호가 존재하지 않습니다");
			}
			
			
		} 
		
		return "loginpage/loginPage01";
		
	}
	
	
	@Autowired
	private LoginService loginService;
	
	
	
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		
		LoginResult result = loginService.login(mid, mpassword);
		
		if (result == LoginResult.FAIL_MID) {
			
			return "redirect:/loginpage/loginPage01?error=fail_mid";
		} else if (result == LoginResult.FAIL_MPASSWORD) {
			
			return "redirect:/loginpage/loginPage01?error=fail_mpassword";
		}

		session.setAttribute("mid", mid);
		
		return "mainpage/mainPage01";
				
	}
	
	
	
	
}
