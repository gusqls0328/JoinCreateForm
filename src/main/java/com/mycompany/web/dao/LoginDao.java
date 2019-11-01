package com.mycompany.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.web.dto.JoinMember;


@Service
public class LoginDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public JoinMember selectMember(String mid) {
		
		JoinMember joinMember = sqlSessionTemplate.selectOne("member.selectJoinMemberById", mid);
		return joinMember;
	}

	
	
	
	
}
