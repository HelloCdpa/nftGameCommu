package com.phl.nft.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.CateDTO;
import com.phl.nft.dto.LikeDTO;
import com.phl.nft.dto.MemberDTO;
import com.phl.nft.dto.PageDTO;
import com.phl.nft.service.BoardServiceImpl;
import com.phl.nft.service.MemberServiceImpl;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@Autowired
	private BoardServiceImpl bs;
	@Autowired
	private MemberServiceImpl ms;
	
	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String saveForm(Model model) {
		List<CateDTO> cList = bs.cateFindAll();
		model.addAttribute("cList",cList);
		return "/board/save";
	}
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute BoardDTO board, Model model) throws IllegalStateException, IOException{
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
	
	// 새로운 게시글에 1일동안 new 로고를 붙임 
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서. 현재 월의 날짜
    String nowday = format.format(cal.getTime());
    
    model.addAttribute("nowday",nowday);
    
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
	
	@RequestMapping(value="Sort", method=RequestMethod.GET)
	public String Sort(Model model,@RequestParam int sort) {
		
		List<BoardDTO> bList =  bs.sort(sort);
		model.addAttribute("bList", bList);
		return "/board/boardFindAll";
		
	}
	
	@RequestMapping(value="cateSort", method=RequestMethod.GET)
	public String cateSort(@RequestParam int cate_number,@RequestParam int sort,Model model) {
		List<BoardDTO> bList =  bs.cateSort(cate_number,sort);
		model.addAttribute("bList", bList);
		CateDTO cate = bs.cateName(cate_number);
		model.addAttribute("c",cate);
		
		return "/board/cateBoard";
	
	}
	
	
	
	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam ("b_number") long b_number,@RequestParam ("m_id") String m_id, Model model) {
		
		BoardDTO board =  bs.boardDetail(b_number);
		LikeDTO like = bs.findLike(b_number, m_id);
		MemberDTO member = ms.mypage(board.getM_id());
		
		model.addAttribute("m",member);
		model.addAttribute("b",board);
		model.addAttribute("like",like);
		
		
		
		return "/board/boardDetail";
	}
	@RequestMapping(value="like",method=RequestMethod.POST)
	public @ResponseBody int like(@ModelAttribute LikeDTO like) {
		int result = bs.insertLike(like);
		
		return result;
	}
	
	@RequestMapping(value = "cateSave", method = RequestMethod.GET)
	public String cateSave(@ModelAttribute CateDTO cate) {
		
		bs.cateSave(cate);
		
		return "redirect:/board/paging";
	}
	
	@RequestMapping(value = "cateBoard", method = RequestMethod.GET)
	public String cateBoardForm(@RequestParam int cate_number, Model model) {
		List<BoardDTO> bList =  bs.findCate(cate_number);
		model.addAttribute("bList",bList);
		CateDTO cate = bs.cateName(cate_number);
		model.addAttribute("c",cate);
		return "/board/catePaging";
	}
	
	@RequestMapping(value="catePaging", method=RequestMethod.GET)
	public String catePaging(@RequestParam int cate_number,@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
	PageDTO paging = bs.catePaging(page,cate_number);
	CateDTO cate = bs.cateName(cate_number);
	List<BoardDTO> bList = bs.catePagingList(page,cate_number);
	model.addAttribute("bList", bList);
	model.addAttribute("paging", paging);
	model.addAttribute("c", cate);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
    String nowday = format.format(cal.getTime());
    
    model.addAttribute("nowday",nowday);
	
	
	
	return "/board/cateBoard";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
