package com.phl.nft.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phl.nft.dto.MemberDTO;


@Repository
public class MemberRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public int join(MemberDTO member) {
		return sql.insert("Member.join",member);
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate", m_id);
	}

	public List<MemberDTO> findAll() {
		return sql.selectList("Member.memberFindAll");
	}
	
	public int memberCount() {
		return sql.selectOne("Member.memberCount");
		}

		public List<MemberDTO> memberPagingList(int pagingStart) {
			return sql.selectList("Member.memberPagingList", pagingStart);
		}

		public List<MemberDTO> memberPagingList1(Map<String, Integer> pagingParam) {
			return sql.selectList("Member.memberPagingList1", pagingParam);
		}

		public void memberDelete(long m_number) {
			sql.delete("Member.memberDelete", m_number);
		}

		public MemberDTO login(MemberDTO member) {
			return sql.selectOne("Member.login", member);
		}

		public MemberDTO mypage(String m_id) {
			return sql.selectOne("Member.mypage",m_id);
		}

		public void memberUpdate(MemberDTO member) {
			sql.update("Member.memberUpdate", member);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}