package com.mycompany.web.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONObject;
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
	
//	@RequestMapping("/checkMid")
//	public void checkMid(String mid, HttpServletResponse response) throws Exception {
//		boolean result = JoinService.checkMid(mid);
//		response.setContentType("application/json; charset=UTF-8");
//		PrintWriter pw = response.getWriter();
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("result", result);
//		pw.print(jsonObject.toString());
//		pw.flush();
//		pw.close();
//	}
	
}
