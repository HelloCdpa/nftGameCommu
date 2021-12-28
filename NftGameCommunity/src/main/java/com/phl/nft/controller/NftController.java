package com.phl.nft.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phl.nft.dto.MemberDTO;
import com.phl.nft.dto.NftDTO;
import com.phl.nft.service.NftServiceImpl;


@Controller
@RequestMapping(value="/nft/*")
public class NftController {
	
	@Autowired
	NftServiceImpl ns;
	
	@RequestMapping(value = "nftSave", method = RequestMethod.GET)
	public String nftSaveForm() {
		return "/nft/nftSave";
	}
	
	@RequestMapping(value = "nftSave", method = RequestMethod.POST)
	public String nftSave(@ModelAttribute NftDTO nft) throws IllegalStateException, IOException{
		ns.nftSave(nft);
		return "redirect:/nft/market";
	}
	
	
	@RequestMapping(value = "market", method = RequestMethod.GET)
	public String marketForm(Model model, @ModelAttribute NftDTO nft) {
		List<NftDTO> nList = ns.nftFindAll(nft);
		model.addAttribute("nList",nList);
		return "/nft/market";
	}
	
	@RequestMapping(value = "nftDetail", method = RequestMethod.GET)
	public String nftDetailForm(Model model, @RequestParam ("nft_number") long nft_number) {
		NftDTO nft = ns.nftDetail(nft_number);
		model.addAttribute("nft",nft);
		return "/nft/nftDetail";
	}
	
	@RequestMapping(value = "nftDelete", method = RequestMethod.GET)
	public String nftdelete(Model model, @RequestParam ("nft_number") long nft_number) {
		 ns.nftDelete(nft_number);
		
		return "redirect:/nft/market";
	}
	
	@RequestMapping(value = "nftUpdate", method = RequestMethod.GET)
	public String nftUpdateForm(Model model, @RequestParam ("nft_number") long nft_number) {
		NftDTO nft = ns.nftDetail(nft_number);
		model.addAttribute("nft",nft);
		return "/nft/nftUpdate";
	}
	
	@RequestMapping(value = "nftUpdate", method = RequestMethod.POST)
	public String nftUpdate(Model model, @ModelAttribute NftDTO nft) {
		ns.nftUpdate(nft);
	
		return "redirect:/nft/market";
	}
	
	@RequestMapping(value = "nftBuyCheck", method = RequestMethod.POST)
	public @ResponseBody String nftBuyCheck(Model model,@RequestParam long nft_number,@RequestParam long nft_price, @RequestParam String m_id) {
		String result = ns.nftBuyCheck(nft_price,m_id);
		return result;	
		}
		
	
	
	@RequestMapping(value = "nftBuy", method = RequestMethod.GET)
	public String nftBuy(Model model,@RequestParam long nft_number,@RequestParam long nft_price, @RequestParam String m_id) {
		
		//멤버포인트 사용 체크, 포인트 이력 업데이트 , 엔에프티에 mid 저장
		ns.nftBuy(nft_number,nft_price,m_id);
		return "redirect:/nft/mynft?m_id="+m_id;
			
			
		}
		
	@RequestMapping(value = "mynft", method = RequestMethod.GET)
	public String mynftForm(@RequestParam String m_id) {
		
	
		return "/nft/market";
	}
	
	
	
	
		
		
	}
	
	


