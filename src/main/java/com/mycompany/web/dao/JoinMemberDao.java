package com.mycompany.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.web.dto.JoinMember;

@Component
public class JoinMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public int insert(JoinMember joinMember) {
		int rows = sqlSessionTemplate.insert("member.insert", joinMember);
		return rows;
	}


	
	public JoinMember selectJoinMember(String mid) {
		JoinMember joinMember = sqlSessionTemplate.selectOne("member.selectJoinMemberById", mid);
		return joinMember;
	}


	

}
