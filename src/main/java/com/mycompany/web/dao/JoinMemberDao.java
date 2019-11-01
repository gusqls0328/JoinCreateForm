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
		
		
//		if (joinMember==null)
//		{
//			return true;
//		} else {
//			
//			return false;
//		}
		
		
	}




	public JoinMember selectedMemberById(String mid) {
		
		JoinMember joinMember = sqlSessionTemplate.selectOne("member.selectJoinMemberById", mid);
		return joinMember;
	}



	public int update(JoinMember joinMember) {
		
		int rows = sqlSessionTemplate.update("member.update", joinMember);
		return rows;
	}



	public int deleteUserInfo(String mid) {
		int rows = sqlSessionTemplate.delete("member.delete", mid);
		return rows;
	}
	
	

}

//private static JoinMemberDao instance;
//private JoinMemberDao() {}
//
//public static JoinMemberDao getInstance() {
//	
//	if(instance == null) 
//		instance = new JoinMemberDao();
//		return instance;
//		
//	
//	
//}