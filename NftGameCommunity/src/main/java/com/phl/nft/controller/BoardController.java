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

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.CateDTO;
import com.phl.nft.dto.PageDTO;
import com.phl.nft.service.BoardServiceImpl;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@Autowired
	private BoardServiceImpl bs;

	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException{
		bs.boardSave(board);
		return "redirect:/board/paging";
	}
	
	@RequestMapping(value = "boardFindAll", method = RequestMethod.GET)
	public String boardFindAll(Model model){
		List<BoardDTO> bList = bs.boardFindAll();
		
		model.addAttribute("bList",bList);
		return "/board/paging";
	}
	
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String boardPaging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
	PageDTO paging = bs.boardPaging(page);
	List<BoardDTO> boardList = bs.boardPagingList(page);
	model.addAttribute("bList", boardList);
	model.addAttribute("paging", paging);
	return "/board/boardFindAll";
	}
	
	
	@RequestMapping(value = "boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam ("b_number") long b_number) {
		
		bs.boardDelete(b_number);
		
		return "redirect:/board/paging";
	}
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.GET)
	public String boardUpdateForm(@RequestParam ("b_number") long b_number, Model model) {
		
		BoardDTO board =  bs.boardDetail(b_number);
		model.addAttribute("b",board);
		
		return "/board/boardUpdate";
	}
	
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(Model model, @ModelAttribute BoardDTO board) 
			 throws IllegalStateException, IOException{
		
		bs.boardUpdate(board);
		
		return "redirect:/board/paging";
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype,
			@RequestParam("keyword") String keyword, Model model) {
		List<BoardDTO> bList = bs.search(searchtype, keyword);
		model.addAttribute("bList", bList);
		
		return "/board/boardFindAll";
	}
	
	
	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam ("b_number") long b_number, Model model) {
		
		BoardDTO board =  bs.boardDetail(b_number);
		model.addAttribute("b",board);
		
		return "/board/boardDetail";
	}
	
	@RequestMapping(value = "cateSave", method = RequestMethod.GET)
	public String cateSave( @ModelAttribute CateDTO cate) {
		
		bs.cateSave(cate);
		
		return "redirect:/board/paging";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
