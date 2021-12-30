package com.phl.nft.service;

import java.io.IOException;
import java.util.List;

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.CateDTO;
import com.phl.nft.dto.LikeDTO;
import com.phl.nft.dto.PageDTO;

public interface BoardService {
	public List<BoardDTO> boardFindAll();
	public PageDTO boardPaging(int page);
	public List<BoardDTO> boardPagingList(int page);
	public void boardDelete(long b_number);
	public BoardDTO boardDetail(long b_number);
	public List<BoardDTO> search(String searchtype, String keyword);
	public void cateSave(CateDTO cate);
	public void boardSave(BoardDTO board) throws IllegalStateException, IOException;
	public void boardUpdate(BoardDTO board) throws IllegalStateException, IOException;
	public List<BoardDTO> findCate(int cate_number);
	public CateDTO cateName(int cate_number);
	List<BoardDTO> catePagingList(int page, int cate_number);
	PageDTO catePaging(int page, int cate_number);
	LikeDTO findLike(long b_number, String m_id);
	int insertLike(LikeDTO like);
	List<CateDTO> cateFindAll();

}
