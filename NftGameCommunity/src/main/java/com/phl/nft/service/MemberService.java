package com.phl.nft.service;

import java.io.IOException;
import java.util.List;

import com.phl.nft.dto.MemberDTO;
import com.phl.nft.dto.PageDTO;



public interface MemberService {

	public void join(MemberDTO member)throws IllegalStateException, IOException;
	public String idDuplicate(String m_id);
	public List<MemberDTO> findAll();
	List<MemberDTO> pagingList(int page);
	PageDTO paging(int page);
	public void delete(long m_number);
	public String login(MemberDTO member);
	MemberDTO mypage(String m_id);
	void memberUpdate(MemberDTO member) throws IllegalStateException, IOException;
	
}
