package com.mycompany.web.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.web.dto.JoinMember;
import com.mycompany.web.service.JoinService;

@Controller
public class JoinFormPageController {

	private static final Logger logger = LoggerFactory.getLogger(JoinFormPageController.class);
	

	@RequestMapping("/")
	public String joinFormPage() {
		
		return "joinFormPage";
		
	}
	
	
	@Autowired
	private JoinService joinService;
	
	
	@PostMapping("/join")
	public String join(JoinMember joinMember, HttpSession session) {
		
		joinService.join(joinMember);
		session.setAttribute("mid", joinMember.getMid());
		
		return "afterJoin/congratulation";
		
	}
	
	@GetMapping("/join")
	public String reJoinPage() {
		//JoinMember joinMember, HttpSession session
//		joinService.join(joinMember);
//		session.setAttribute("mid", joinMember.getMid());
		
		return "redirect:/afterJoin/congratulation";
		
	}
	
	@RequestMapping("/checkMid")
	public void checkMid(String mid, HttpServletResponse response) throws Exception {
		boolean result = joinService.checkMid(mid);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();	
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		pw.print(jsonObject.toString());
		pw.flush();
		pw.close();
		
	}
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/getJoinContent")
	public String getJoinContent(String mid, Model model) {
		
		JoinMember joinMember = sqlSessionTemplate.selectOne("member.selectJoinMemberById", mid);
		model.addAttribute("joinMember", joinMember);
		
		return "afterJoin/congratulation";
		
	}
	
	@RequestMapping("/modifyJoinContent")
	public String modifyJoinContent(HttpServletRequest request, HttpSession session, Model model) {
		
		String mid = session.getAttribute("mid").toString();
		JoinMember joinMember = joinService.selectedMemberById(mid);
		model.addAttribute("joinMember", joinMember);
		
		return "afterJoin/modifyJoinContent";
	}
	
	@RequestMapping("/correctJoinContent")
	public String correctJoinContent(JoinMember joinMember) {
//		System.out.println(joinMember.getMid());
//		System.out.println(joinMember.getMname());
//		System.out.println(joinMember.getMpassword());
		joinService.correctJoinContent(joinMember);
		//session.removeAttribute("mid");
		return "afterJoin/congratulation";
		
	}

	
	@RequestMapping("/redirectToCongratulation")
	public String redirectToCongratulation(HttpServletRequest request, HttpSession session, Model model) {
		
		String mid = session.getAttribute("mid").toString();
		JoinMember joinMember = joinService.selectedMemberById(mid);
		model.addAttribute("joinMember", joinMember);
		return "afterJoin/congratulation";
		
	}
	
//	@GetMapping("/redirectToCongratulation")
//	public String redirectToCongratulation2(String mid, Model model) {
//		JoinMember joinMember = joinService.selectedMemberById(mid);
//		model.addAttribute("joinMember", joinMember);
//		//List<JoinMember> joinMemberList = service.getJoinList(mid, )
//		return "afterJoin/congratulation";
//	}
	
	@RequestMapping("/redirectToMainPage01")
	public String redirectToMainPage01() {
		
		return "mainpage/mainPage01";
		
	}
	
	@RequestMapping("/deleteUserInfo")
	public String deleteUserInfo(HttpSession session) {
		
		String mid = (String)session.getAttribute("mid");
		
		joinService.deleteUserInfo(mid);
		return "joinFormPage";
	}
	
	@GetMapping("/loginPage01")
	public String loginPage01() {
		
		return "loginpage/loginPage01";
		
	}
	
	
}




//@GetMapping("/getJoinAfterContent")
//public void getJoinAfterContent(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			
//	response.setContentType("text/html; charset=UTF-8");
//	
//	String mname = request.getParameter("mname");
//	String mid = request.getParameter("mid");
//	String mpassword = request.getParameter("mpassword");
//	
//	
//	PrintWriter out = response.getWriter();
//	out.print("<html><body>");
//	out.println("이름: ");
//	out.println(mid);
//	out.println("아이디: ");
//	out.println(mname);
//	out.println("비밀번호: ");
//	out.println(mpassword);
//	
//