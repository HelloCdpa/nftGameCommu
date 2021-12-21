package com.phl.nft.service;

import java.io.IOException;
import java.util.List;

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.CateDTO;
import com.phl.nft.dto.PageDTO;

public interface BoardService {
	public void boardSave(BoardDTO board)throws IllegalStateException, IOException;
	public List<BoardDTO> boardFindAll();
	public PageDTO boardPaging(int page);
	public List<BoardDTO> boardPagingList(int page);
	void boardDelete(long b_number);
	public BoardDTO boardDetail(long b_number);
	public void boardUpdate(BoardDTO board) throws IllegalStateException, IOException;
	public List<BoardDTO> search(String searchtype, String keyword);
	void cateSave(CateDTO cate);

}
