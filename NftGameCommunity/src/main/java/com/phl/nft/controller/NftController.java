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
		return "redirect:/board/paging";
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
	
	
	
}

