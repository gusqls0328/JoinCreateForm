package com.mycompany.web.service;

import org.mybatis.spring.SqlSessionTemplate;
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

}
