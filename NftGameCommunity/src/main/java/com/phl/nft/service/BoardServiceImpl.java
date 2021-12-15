package com.phl.nft.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.PageDTO;
import com.phl.nft.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardRepository br;

	@Override
	public void boardSave(BoardDTO board) throws IllegalStateException, IOException{
		
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		System.out.println("b_filename: " + b_filename);
		// 파일 저장하기 
		String savePath = "D:\\development_Phl\\source\\spring\\MemberBoardProject\\src\\main\\webapp\\resources\\board_upload\\"+b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		
		board.setB_filename(b_filename);
		br.saveFile(board);
		
		
	}
	
	
	
	@Override
	public List<BoardDTO> boardFindAll() {
		return br.boardFindAll();
	}
	


	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수

	@Override
	public List<BoardDTO> boardPagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);

	List<BoardDTO> pagingList = br.boardPagingList1(pagingParam);
	for(BoardDTO b: pagingList) {
	System.out.println(b.toString());
	}
	return pagingList;
	}

	@Override
	public PageDTO boardPaging(int page) {
		int boardCount = br.boardCount();
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
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
	public void boardDelete(long b_number) {
		br.boardDelete(b_number);
	}



	@Override
	public BoardDTO boardDetail(long b_number) {
		return br.boardDetail(b_number);
	}


	@Override
	public void boardUpdate(BoardDTO board) throws IllegalStateException, IOException{
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		System.out.println("b_filename: " + b_filename);
		// 파일 저장하기 
		String savePath = "D:\\development_Phl\\source\\spring\\MemberBoardProject\\src\\main\\webapp\\resources\\board_upload\\"+b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		
		board.setB_filename(b_filename);		
		br.boardUpdate(board);
	}



	@Override
	public List<BoardDTO> search(String searchtype, String keyword) {
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		List<BoardDTO> bList = br.search(searchParam);
		return bList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	

