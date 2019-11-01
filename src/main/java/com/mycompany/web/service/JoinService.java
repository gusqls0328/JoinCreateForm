package com.mycompany.web.service;

import java.util.List;

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
		
//		boolean result = joinMemberDao.selectJoinMember(mid);
//		return result;	
		
	}



	public JoinMember selectedMemberById(String mid) {
		
		JoinMember joinMember = joinMemberDao.selectedMemberById(mid);
		return joinMember;
	}



	public void correctJoinContent(JoinMember joinMember) {
		
		joinMemberDao.update(joinMember);
		
		
	}



	public void deleteUserInfo(String mid) {
		
		joinMemberDao.deleteUserInfo(mid);
		
	}



}
