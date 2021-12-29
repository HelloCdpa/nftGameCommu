package com.phl.nft.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.phl.nft.dto.MemberDTO;
import com.phl.nft.dto.PageDTO;
import com.phl.nft.dto.PointDTO;
import com.phl.nft.repository.MemberRepository;


@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public void join(MemberDTO member) {
		
		mr.join(member);
		
		}
	
	@Override
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		 
		 if(result == null) {
			 return "ok";
		 } else {
			 return "no";
		 }	 
		}
	@Override
	public List<MemberDTO> findAll() {
		return mr.findAll();
	}
	


	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수

	@Override
	public List<MemberDTO> pagingList(int page) {
		// TODO Auto-generated method stub
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);

//			List<BoardDTO> pagingList = br.pagingList(pagingStart);
	List<MemberDTO> pagingList = mr.memberPagingList1(pagingParam);
	for(MemberDTO b: pagingList) {
	System.out.println(b.toString());
	}
	return pagingList;
	}

	@Override
	public PageDTO paging(int page) {
		int memberCount = mr.memberCount();
		int maxPage = (int)(Math.ceil((double)memberCount / PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage;
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);

		
		System.out.println("paging.toString(): "+ paging.toString());

		return paging;
	}

	@Override
	public void delete(long m_number) {
		mr.memberDelete(m_number);
	}

	@Override
	public String login(MemberDTO member) {
		
		MemberDTO loginMember = mr.login(member);
		
		if(loginMember != null) {
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", member.getM_number());
			return "redirect:/board/paging";
		} else {
			return "/member/login";
		}
		
	}
	@Override
	public MemberDTO mypage(String m_id) {
		return mr.mypage(m_id);
	}
	
	@Override
	public void memberUpdate(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_profile = member.getM_profile();
		String m_profilename = m_profile.getOriginalFilename();
		m_profilename = System.currentTimeMillis() + "-" + m_profilename;
		System.out.println("m_profilename: " + m_profilename);
		String savePath = "D:\\development_Phl\\source\\spring\\MemberBoardProject\\src\\main\\webapp\\resources\\nft\\"+m_profilename;
		if(!m_profile.isEmpty()) {
			m_profile.transferTo(new File(savePath));
		}
		
		member.setM_profilename(m_profilename);
		mr.memberUpdate(member);
	}

	@Override
	public List<PointDTO> pointView(String m_id) {
		return mr.pointView(m_id);
	}
	@Override
	public MemberDTO pointAll(String m_id) {
		return mr.pointAll(m_id);
	}
	
	@Override
	public void pointCharge(String m_id, int m_point) {

		mr.pointCharge(m_id,m_point);
		mr.memberPointCharge(m_id,m_point,"포인트 충전");
	}
	@Override
	public void nftprofile(MemberDTO member) {
		mr.nftprofile(member);
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
