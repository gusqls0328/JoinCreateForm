package com.mycompany.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	@RequestMapping("/loginPage01")
	public String loginPage01() {
		
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
