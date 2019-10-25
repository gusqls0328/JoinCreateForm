package com.mycompany.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.web.dao.JoinMemberDao;
import com.mycompany.web.dto.JoinMember;

@Component
public class JoinService {
	
	@Autowired
	private JoinMemberDao joinMemberDao;
	
	
	
	public void join(JoinMember joinMember) {
		joinMemberDao.insert(joinMember);
		
	}



	public boolean checkMid(String mid) {
		
		JoinMember joinMember = joinMemberDao.selectJoinMember(mid);
		if (joinMember == null) {
			
			return true;	
		} else {
			
			return false;
		}
		
	}



}
