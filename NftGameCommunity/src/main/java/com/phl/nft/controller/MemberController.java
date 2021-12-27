package com.phl.nft.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phl.nft.dto.MemberDTO;
import com.phl.nft.dto.PageDTO;
import com.phl.nft.dto.PointDTO;
import com.phl.nft.service.MemberServiceImpl;


@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl ms;

	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException{
		ms.join(member);
		return "index";
	}
	
	@RequestMapping(value = "idDuplicate", method = RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam ("m_id") String m_id) {
		
		String result = ms.idDuplicate(m_id); 
		return result;
	}
	
	@RequestMapping(value = "findAll", method = RequestMethod.GET)
	public String findAll(Model model) {
		
		List<MemberDTO> mList = ms.findAll();
		model.addAttribute("mList",mList);
		
		return "/member/paging";
	}
	
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
	PageDTO paging = ms.paging(page);
	List<MemberDTO> memberList = ms.pagingList(page);
	model.addAttribute("mList", memberList);
	model.addAttribute("paging", paging);
	return "member/memberFindAll";
	}
	
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam ("m_number") long m_number) {
		
		ms.delete(m_number);
		
		return "redirect:/member/paging";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {	
		return "/member/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member){
		
		String resultpage = ms.login(member);
		return resultpage;
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {	
		session.invalidate();
		return "index";
	}
	
	
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String adminPage() {	
		
		return "admin";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(Model model ,@RequestParam ("m_id") String m_id) {	
		
		 MemberDTO member = ms.mypage(m_id);
		 model.addAttribute("m", member);
		
		return "/member/mypage";
	}
	

	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(Model model,@ModelAttribute MemberDTO member) throws IllegalStateException, IOException{	
		
		ms.memberUpdate(member);
		return "index" ;
	}
	
	
	@RequestMapping(value = "pointView", method = RequestMethod.GET)
	public String pointViewForm(Model model ,@RequestParam ("m_id") String m_id) {	
		
		 List <PointDTO> pList = ms.pointView(m_id);
		 model.addAttribute("pList", pList);
		 
		 MemberDTO member = ms.pointAll(m_id);
		 model.addAttribute("m", member);
		 
		 
		return "/member/pointView";
	}
	
	@RequestMapping(value = "pointCharge", method = RequestMethod.GET)
	public String pointChargeForm(Model model ,@RequestParam ("m_id") String m_id) {	
		 
		return "/member/pointCharge";
	}
	
	@RequestMapping(value = "pointCharge1", method = RequestMethod.POST)
	public String pointCharge1(@RequestParam ("m_id") String m_id, @RequestParam ("m_point") int m_point) {	
		System.out.println(m_id +"어디갔니?"+m_point);
		ms.pointCharge(m_id,m_point);
		 
		 
		return "redirect:/member/pointView?m_id="+m_id;
	}
	@RequestMapping(value = "pointCharge2", method = RequestMethod.POST)
	public String pointCharge2(@RequestParam ("m_id") String m_id, @RequestParam ("m_point") int m_point) {	
		System.out.println(m_id +"어디갔니?"+m_point);
		ms.pointCharge(m_id,m_point);
		 
		 
		return "redirect:/member/pointView?m_id="+m_id;
	}
	@RequestMapping(value = "pointCharge3", method = RequestMethod.POST)
	public String pointCharge3(@RequestParam ("m_id") String m_id, @RequestParam ("m_point") int m_point) {	
		System.out.println(m_id +"어디갔니?"+m_point);
		ms.pointCharge(m_id,m_point);
		 
		 
		return "redirect:/member/pointView?m_id="+m_id;
	}
	
	
	

}
