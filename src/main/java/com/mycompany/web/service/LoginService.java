package com.mycompany.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.web.dao.LoginDao;
import com.mycompany.web.dto.JoinMember;

@Service
public class LoginService {

	@Autowired
	private LoginDao loginDao;
	
	public LoginResult login(String mid, String mpassword) {
		
		JoinMember joinMember = loginDao.selectMember(mid);
		
		if (joinMember == null) {
			
			return LoginResult.FAIL_MID;
		} else {
			
			if (mpassword.equals(joinMember.getMpassword())) {
				
				return LoginResult.SUCCESS;
				
			} else {
				
				return LoginResult.FAIL_MPASSWORD;
			}
			
		}
		
	}

	
}
