package com.mycompany.web.controller;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.web.dto.JoinMember;
import com.mycompany.web.service.JoinService;

@Controller
public class JoinFormPageController {

	private static final Logger logger = LoggerFactory.getLogger(JoinFormPageController.class);
	
	@Resource(name = "dataSource")
	private DataSource dataSource;

	@RequestMapping("/")
	public String joinFormPage() {
		
		return "joinFormPage";
		
	}
	
//	@GetMapping("/join")
//	public String nextPage01() {
//		return "nextpage/nextPage01";
//		
//	}
	
	@Autowired
	private JoinService joinService;
	
//	@Autowired
//	private SqlSessionTemplate sqlSessionTemplate;
	
	@PostMapping("/join")
	public String join(JoinMember joinMember) {
		joinService.join(joinMember);
		return "nextpage/nextPage01";
	}
	
}
