package com.phl.nft.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.CateDTO;


@Repository
public class BoardRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void saveFile(BoardDTO board) {
		sql.insert("Board.boardSave", board);

	}

	public List<BoardDTO> boardFindAll() {
		return sql.selectList("boardFindAll");
	}

	public int boardCount() {
		return sql.selectOne("Board.boardCount");
	}

	public List<BoardDTO> boardPagingList(int pagingStart) {
		return sql.selectList("Board.boardPagingList", pagingStart);
	}

	public List<BoardDTO> boardPagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.boardPagingList1", pagingParam);
	}

	public void boardDelete(long b_number) {
		sql.delete("Board.boardDelete", b_number);
	}


	public BoardDTO boardDetail(long b_number) {
		sql.update("Board.hitsUpdate",b_number);
		return sql.selectOne("Board.boardDetail",b_number);
	}

	
	
	
	public void boardUpdate(BoardDTO board) {
		sql.update("Board.boardUpdate", board);
	}

	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

	public void cateSave(CateDTO cate) {
		sql.insert("cate.cateSave",cate);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
